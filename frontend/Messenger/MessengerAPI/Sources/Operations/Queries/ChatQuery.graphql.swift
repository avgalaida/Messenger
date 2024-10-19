// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ChatQuery: GraphQLQuery {
  public static let operationName: String = "Chat"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Chat($a: Int!, $b: Int!) { chat(a: $a, b: $b) { __typename id senderid receiverid text } }"#
    ))

  public var a: Int
  public var b: Int

  public init(
    a: Int,
    b: Int
  ) {
    self.a = a
    self.b = b
  }

  public var __variables: Variables? { [
    "a": a,
    "b": b
  ] }

  public struct Data: MessengerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.MessengerQuery }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("chat", [Chat].self, arguments: [
        "a": .variable("a"),
        "b": .variable("b")
      ]),
    ] }

    public var chat: [Chat] { __data["chat"] }

    /// Chat
    ///
    /// Parent Type: `Message`
    public struct Chat: MessengerAPI.SelectionSet {
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
