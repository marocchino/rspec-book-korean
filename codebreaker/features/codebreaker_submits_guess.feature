# language: ko

기능: 코드브레이커 추측을 입력
  코드브레이커는 4자리로 된 추측을 입력합니다
  게임은 추측을 +, - 기호로 표시합니다

  시크릿 코드의 각 숫자에서 수와 위치가 일치하는 추측은+ 기호로 표시합니다
  시크릿 코드의 수가 아니면서 위치가 일치하는 추측은 - 기호로 표시합니다

  시크릿 코드의 각 숫자는 오직 한번만 일치 할 수 있습니다
  예를 들어 시크릿 코드 1234에 대해 1134로 추측 할 경우 두번째 위치의 숫자는 무시되어 +++ 를 얻을 것입니다.

  코드 브레이커 로써
  추측을 입력하고 싶다
  그로인해 코드 해독을 시도할 수 있다

  시나리오: 모두 정확히 일치
    먼저 시크릿 코드는 "1234"
    만일 "1234"를 추측합니다
    그러면 표시는 "++++"이어야 합니다

  시나리오: 2개는 정확히 일치 2개는 수가 일치
    먼저 시크릿 코드는 "1234"
    만일 "1243"를 추측합니다
    그러면 표시는 "++--"이어야 합니다

  시나리오: 1개는 정확히 일치 3개는 수가 일치
    먼저 시크릿 코드는 "1234"
    만일 "1342"를 추측합니다
    그러면 표시는 "+---"이어야 합니다

  시나리오: 4개의 수가 일치
    먼저 시크릿 코드는 "1234"
    만일 "4321"를 추측합니다
    그러면 표시는 "----"이어야 합니다

  시나리오 개요: 추측을 입력
    먼저 시크릿 코드는 "<code>"
    만일 "<guess>"를 추측합니다
    그러면 표시는 "<mark>"이어야 합니다

  예: 불일치
    | code | guess | mark |
    | 1234 | 5555  |      |

  예: 1 숫자만 일치
    | code | guess | mark |
    | 1234 | 1555  | +    |
    | 1234 | 2555  | -    |

  예: 2 숫자만 일치
    | code | guess | mark |
    | 1234 | 5254  | ++   |
    | 1234 | 5154  | +-   |
    | 1234 | 2545  | --   |

  예: 3 숫자만 일치
    | code | guess | mark |
    | 1234 | 5234  | +++  |
    | 1234 | 5134  | ++-  |
    | 1234 | 5124  | +--  |
    | 1234 | 5123  | ---  |

  예: 모든 수가 일치
    | code | guess | mark |
    | 1234 | 1234  | ++++ |
    | 1234 | 1243  | ++-- |
    | 1234 | 1423  | +--- |
    | 1234 | 4321  | ---- |

  예: 중복 일치
    | code | guess | mark |
    | 1234 | 1155  | +    |
    | 1234 | 5115  | -    |
    | 1134 | 1155  | ++   |
    | 1134 | 5115  | +-   |
    | 1134 | 5511  | --   |
    | 1134 | 5111  | +-   |


