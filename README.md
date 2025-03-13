# Web3

## 长期需要培养的素质
- 分析 DeFi、NFT、元宇宙应用的结构
- 了解区块链的基础设施发展（跨链、扩容）
- 经济学和金融知识、常识和洞察

## 学习路线图
### 入门
- 合约的基本结构
  - 合约中的成员变量
    - 存储合约状态的变量
    - 声明方法：`类型 [访问修饰符] 变量名`
    - 默认：`internal`
  - 成员函数
  - `event`、`modifier`、`constructor`
- 成员变量的可见性
  - 三个维护：合约外部、本合约、子合约
  - `public`：完全可见
  - `private`：对本合约可见
  - `internal`：对继承子合约可见
  - 默认值的问题
- 合约函数
  - `function fname([参数]) [可见性] [交易相关] […] returns(返回值) {}`
  - 修饰：修饰部分内容丰富，重点介绍
- 合约函数的交易属性
  - `view`：合约状态读操作
  - `pure`：与合约状态无关的函数
  - 默认是写操作
  - `view`、`pure` 和 `public` 有不同的概念和实际意义
- 数据类型
  - 值类型（Value Type）
  - 引用类型（Reference Type）

### 值类型 (Value Type)
- **整数、枚举、布尔**
  - `int`/`uint` 以 8 位字长递增，`uint` 是 `uint256` 的别称
  - 类型 `x`，`type(x).min()` 和 `type(x).max()` 取该类型的最大值和最小值
  - 以太坊虚拟机是 256 位机器
  - 低版本取模，高版本异常：Safe Math
  - 枚举类型最多 256 个成员，最少一个，默认值是第一个成员，必须显式转换
- **Address、Contract**
  - **Address**
    - 20 个字节长度
    - 关于可支付：`address payable` 可支付，有成员函数 `transfer` 和 `send`
    - `address payable` 可转换为 `address`，反之需要显式转换
    - `address` 可转换为 `uint160` 和 `bytes20`
    - 合约账号地址与外部账号地址（EOA，External Owned Account）
    - `call`、`balance`
  - **Contract**
    - 合约可以隐式转换为他的父合约
    - 合约可以显式转换为地址类型 `address`
    - 合约不支持任何运算符号
    - 合约变量调用合约函数
    - 合约可以用 `new` 操作符部署另一合约
- **Fixed Byte Array（定长字节数组）**
  - 从 `bytes1` 到 `bytes32`
  - 通过下标访问元素
  - 通过 `length` 读取长度

