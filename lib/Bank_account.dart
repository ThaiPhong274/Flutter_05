class BankAccout{
  int accoutNumber;
  String ownerName;
  double _balance;
  BankAccout(this.accoutNumber,this.ownerName,this._balance);
  void deposit(double num){
    _balance += num;
  }
  void withdraw(double num){
    if (_balance < 50) return;
    _balance -= num;
  }
  double get checkBalance => _balance;
}
