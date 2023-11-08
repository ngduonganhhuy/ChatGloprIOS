// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseLogin = try ResponseLogin(json)

import Foundation

// MARK: - ResponseLogin

class ResponseLogin: Codable {
    let success: Bool?
    let statusCode: Int?
    let message: String?
    let data: LoginData?

    init(success: Bool?, statusCode: Int?, message: String?, data: LoginData?) {
        self.success = success
        self.statusCode = statusCode
        self.message = message
        self.data = data
    }
}

// MARK: ResponseLogin convenience initializers and mutators

extension ResponseLogin {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ResponseLogin.self, from: data)
        self.init(success: me.success, statusCode: me.statusCode, message: me.message, data: me.data)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: Data(contentsOf: url))
    }

    func with(
        success: Bool? = nil,
        statusCode: Int? = nil,
        message: String? = nil,
        data: LoginData? = nil
    ) -> ResponseLogin {
        return ResponseLogin(
            success: success ?? self.success,
            statusCode: statusCode ?? self.statusCode,
            message: message ?? self.message,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return try String(data: self.jsonData(), encoding: encoding)
    }
}

// MARK: - LoginData

class LoginData: Codable {
    let accessToken, refreshToken: String?
    let info: Info?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken, info
    }

    init(accessToken: String?, refreshToken: String?, info: Info?) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.info = info
    }
}

// MARK: LoginData convenience initializers and mutators

extension LoginData {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(LoginData.self, from: data)
        self.init(accessToken: me.accessToken, refreshToken: me.refreshToken, info: me.info)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: Data(contentsOf: url))
    }

    func with(
        accessToken: String?,
        refreshToken: String?,
        info: Info?
    ) -> LoginData {
        return LoginData(
            accessToken: accessToken ?? self.accessToken,
            refreshToken: refreshToken ?? self.refreshToken,
            info: info ?? self.info
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return try String(data: self.jsonData(), encoding: encoding)
    }
}

// MARK: - Info

class Info: Codable {
    let id, email, fullName, userName: String?
    let phoneNumber: String?
    let avatar: String?
    let dob, gender, lastLogin: String?

    init(id: String?, email: String?, fullName: String?, userName: String?, phoneNumber: String?, avatar: String?, dob: String?, gender: String?, lastLogin: String?) {
        self.id = id
        self.email = email
        self.fullName = fullName
        self.userName = userName
        self.phoneNumber = phoneNumber
        self.avatar = avatar
        self.dob = dob
        self.gender = gender
        self.lastLogin = lastLogin
    }
}

// MARK: Info convenience initializers and mutators

extension Info {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Info.self, from: data)
        self.init(id: me.id, email: me.email, fullName: me.fullName, userName: me.userName, phoneNumber: me.phoneNumber, avatar: me.avatar, dob: me.dob, gender: me.gender, lastLogin: me.lastLogin)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: Data(contentsOf: url))
    }

    func with(
        id: String?? = nil,
        email: String?? = nil,
        fullName: String?? = nil,
        userName: String?? = nil,
        phoneNumber: String?? = nil,
        avatar: String?? = nil,
        dob: String?? = nil,
        gender: String?? = nil,
        lastLogin: String?? = nil
    ) -> Info {
        return Info(
            id: id ?? self.id,
            email: email ?? self.email,
            fullName: fullName ?? self.fullName,
            userName: userName ?? self.userName,
            phoneNumber: phoneNumber ?? self.phoneNumber,
            avatar: avatar ?? self.avatar,
            dob: dob ?? self.dob,
            gender: gender ?? self.gender,
            lastLogin: lastLogin ?? self.lastLogin
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return try String(data: self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
