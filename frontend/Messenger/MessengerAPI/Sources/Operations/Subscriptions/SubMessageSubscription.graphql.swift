// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SubMessageSubscription: GraphQLSubscription {
  public static let operationName: String = "SubMessage"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription SubMessage { onMessageSend { __typename id senderid receiverid text } }"#
    ))

  public init() {}

  public struct Data: MessengerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.MessengerSubscribtion }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("onMessageSend", OnMessageSend.self),
    ] }

    public var onMessageSend: OnMessageSend { __data["onMessageSend"] }

    /// OnMessageSend
    ///
    /// Parent Type: `Message`
    public struct OnMessageSend: MessengerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.Message }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("senderid", Int.self),
        .field("receiverid", Int.self),
        .field("text", String?.self),
      ] }

      public var id: Int { __data["id"] }
      public var senderid: Int { __data["senderid"] }
      public var receiverid: Int { __data["receiverid"] }
      public var text: String? { __data["text"] }
    }
  }
}
