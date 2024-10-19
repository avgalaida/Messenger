// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SubContactsSubscription: GraphQLSubscription {
  public static let operationName: String = "SubContacts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription SubContacts { onUserReg { __typename id username } }"#
    ))

  public init() {}

  public struct Data: MessengerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.MessengerSubscribtion }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("onUserReg", OnUserReg.self),
    ] }

    public var onUserReg: OnUserReg { __data["onUserReg"] }

    /// OnUserReg
    ///
    /// Parent Type: `User`
    public struct OnUserReg: MessengerAPI.SelectionSet {
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
