//
//  TranslationTargetType.swift
//  RepositoryTests
//
//  Created by cheonsong on 2022/09/13.
//

import Foundation
import Moya

//π μ°Έκ³ : https://github.com/Moya/Moya/blob/master/docs/Targets.md

public enum TranslationTargetType {
    case requestTranslation(TranslationDTO) // λ²μ­ μμ²­
}

extension TranslationTargetType: BaseTargetType {
    
    // API μλ²μ baseURL
    // EX) return api.dallalive.com
    public var baseURL: URL {
        return URL(string: NetworkURL.naverUrl)!
    }
    
    // μλ²μ base URL λ€μ μΆκ° λ  Path (μΌλ°μ μΌλ‘ API)
    // EX) case .broadcast(_) return "/brodcast"
    public var path: String {
        switch self {
        case .requestTranslation(_):
            return "/v1/papago/n2mt"
        }
    }
    
    // HTTP λ©μλ (ex. .get / .post / .delete λ±λ±)
    // EX) case .broadcast: return .get
    public var method: Moya.Method {
        switch self {
        case .requestTranslation(_):
            return .post
        }
    }
    
    // requestμ μ¬μ©λλ νλΌλ―Έν° μ€μ 
    // plain request : μΆκ° λ°μ΄ν°κ° μλ request
    // data request : λ°μ΄ν°κ° ν¬ν¨λ requests body
    // parameter request : μΈμ½λ©λ λ§€κ° λ³μκ° μλ requests body
    // JSONEncodable request : μΈμ½λ© κ°λ₯ν μ νμ requests body
    // upload request
    // EX) case .broadcast: return .plain
    public var task: Task {
        switch self {
        case .requestTranslation(let request):
            // νλΌλ―Έν°λ₯Ό λμλλ¦¬ννλ‘ λ§λ€μ΄μ λ£μ΄λ λκ³ 
            // Encodable DTOλ₯Ό λ§λ€μ΄μ λ£μ΄λ λ©λλ€
            let request: [String: Any] = [
                "source": request.source,
                "target": request.target,
                "text": request.text
            ]
            return .requestParameters(parameters: request, encoding: URLEncoding.queryString)
//            return .requestJSONEncodable(request)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .requestTranslation(let translationDTO):
            return ["Content-Type": "application/x-www-form-urlencoded",
                    "X-Naver-Client-Id": AppKey.naverClientID,
                    "X-Naver-Client-Secret": AppKey.naverClientSecret,
                    "Content-length" : "\(translationDTO.text.count)"]
        }
        
    }
}
