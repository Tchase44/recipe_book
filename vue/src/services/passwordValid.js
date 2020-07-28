const passChacker = {
  stringCheck(str){
    return typeof(str) === "string"
  },
  lengthCheck(str){
    return str.length >= 6
  },
  numberCheck(str){
    return str.split("").filter( x => parseInt(x) !== NaN ) > 0
  },
  specialCheck(str){},
  caseCheck(str){},
  runTheChecks(test){
    const checks = {}
    checks.str = this.stringCheck(test)
    checks.length = this.lengthCheck(test)
    checks.number = this.numberCheck(test)
    checks.special = this.specialCheck(test)
    checks.case = this.caseCheck(test)
    return checks
  }
}