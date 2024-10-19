// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ContactsQuery: GraphQLQuery {
  public static let operationName: String = "Contacts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Contacts { users { __typename id username } }"#
    ))

  public init() {}

  public struct Data: MessengerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.MessengerQuery }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("users", [User].self),
    ] }

    public var users: [User] { __data["users"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: MessengerAPI.SelectionSet {
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
