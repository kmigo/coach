abstract class ContractCreateThought {
  refresh();
  success();
  failure(String text);
}

class PresenterCreateThought {
  final ContractCreateThought _contract;
  PresenterCreateThought(this._contract);
  refresh() => _contract.refresh();
  success() => _contract.success();
  failure(String text) => _contract.failure(text);
}
