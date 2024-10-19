// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SendMutation: GraphQLMutation {
  public static let operationName: String = "Send"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Send($from: Int!, $to: Int!, $text: String!) { sendMessage(from: $from, to: $to, text: $text) { __typename id } }"#
    ))

  public var from: Int
  public var to: Int
  public var text: String

  public init(
    from: Int,
    to: Int,
    text: String
  ) {
    self.from = from
    self.to = to
    self.text = text
  }

  public var __variables: Variables? { [
    "from": from,
    "to": to,
    "text": text
  ] }

  public struct Data: MessengerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.MessengerMutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("sendMessage", SendMessage?.self, arguments: [
        "from": .variable("from"),
        "to": .variable("to"),
        "text": .variable("text")
      ]),
    ] }

    public var sendMessage: SendMessage? { __data["sendMessage"] }

    /// SendMessage
    ///
    /// Parent Type: `Message`
    public struct SendMessage: MessengerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MessengerAPI.Objects.Message }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
      ] }

      public var id: Int { __data["id"] }
    }
  }
}
