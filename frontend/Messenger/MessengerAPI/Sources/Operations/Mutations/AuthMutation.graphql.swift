// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AuthMutation: GraphQLMutation {
  public static let operationName: String = "Auth"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Auth($username: String!, $password: String!) { authorize(username: $username, password: $password) { __typename id username } }"#
    ))

  public var username: String
  public var password: String

  public init(
    username: String,
    password: String
  ) {
    self.username = username
    self.password = password
  }

  public var __variables: Variables? { [
    "username": username,
    "password": password
  ] }

  public struct Data: MessengerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.MessengerMutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("authorize", Authorize?.self, arguments: [
        "username": .variable("username"),
        "password": .variable("password")
      ]),
    ] }

    public var authorize: Authorize? { __data["authorize"] }

    /// Authorize
    ///
    /// Parent Type: `User`
    public struct Authorize: MessengerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("username", String?.self),
      ] }

      public var id: Int { __data["id"] }
      public var username: String? { __data["username"] }
    }
  }
}
