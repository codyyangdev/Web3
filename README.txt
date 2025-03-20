# 每日听课笔记 - Solidity

## 长期需要培养的素质
- 分析 DeFi、NFT、元宇宙应用的结构
- 了解区块链基础设施的发展（跨链、扩容）
- 经济学和金融知识、常识与洞察

## 学习路线图
### 入门

## 合约的基本结构
- **成员变量**
  - 存储合约状态的变量
  - 声明方式：`类型 [访问修饰符] 变量名`
  - 默认修饰符：`internal`
- **成员函数**
- **其他元素**：`event`、`modifier`、`constructor`

### 成员变量的可见性
- 三种作用范围：合约外部、本合约、子合约
- `public`：完全可见
- `private`：仅本合约可见
- `internal`：本合约及继承的子合约可见
- 默认值问题：未显式初始化的变量有默认值

### 合约函数
格式：`function fname([参数]) [可见性] [交易相关] […] returns (返回值) {}`
- **修饰符**：内容丰富，需重点理解

#### 合约函数的交易属性
- `view`：仅读取合约状态，不修改
- `pure`：与合约状态无关的纯计算函数
- 默认：写操作（可修改状态）
- `view`、`pure` 和 `public` 的概念和意义不同

## 数据类型
- **值类型 (Value Type)**
- **引用类型 (Reference Type)**

### 值类型 (Value)
- **整数、枚举、布尔**
  - `int`/`uint`：以 8 位字长递增，`uint` 是 `uint256` 的别名
  - 获取范围：`type(x).min()` 和 `type(x).max()`
  - 以太坊虚拟机 (EVM) 为 256 位机器
  - 低版本取模，高版本抛异常（需使用 SafeMath）
  - 枚举：最多 256 个成员，至少 1 个，默认值为第一个成员，需显式转换
- **Address 和 Contract**
  - `address`
    - 长度：20 字节
    - `address payable`：可支付地址，包含 `transfer` 和 `send` 函数
    - 类型转换：`address payable` 可转为 `address`，反之需显式转换
    - 可转为 `uint160` 和 `bytes20`
    - 区分：合约账号地址与外部账号地址 (EOA, External Owned Account)
    - 功能：`call`、`balance`
  - `contract`
    - 可隐式转换为父合约
    - 可显式转换为 `address`
    - 不支持运算符
    - 通过合约变量调用函数
    - 使用 `new` 操作符部署新合约
- **定长字节数组 (Fixed Byte Array)**
  - 范围：`bytes1` 到 `bytes32`
  - 通过下标访问元素
  - 通过 `length` 获取长度

### 引用类型 (Reference)
- **存储位置 (Location)**
  - EVM 数据访问位置：`memory`、`storage`、`calldata`
  - `calldata`：实际为交易的数据字段
- **数组 (Array)**
  - 不同 `location` 被视为不同类型，可调用方法不同
  - `storage` 和 `memory` 中的动态数组
  - 限制：数组元素类型不能是映射 (mapping)
- **结构体 (Struct)**
  - 自定义类型
  - 可用于状态变量、局部变量、参数、返回值
  - 可嵌套在 `mapping` 或数组中，成员可为 `mapping` 或数组
- **映射 (Mapping)**
  - 声明：`mapping(keyType => valueType)`
  - `keyType`：基本类型（包括 `bytes` 和 `string`），不可为枚举或复杂类型（合约、枚举、结构体、映射）
  - `valueType`：支持任意类型（包括 `mapping`）
  - 使用场景：状态变量、`storage` 型局部变量、库函数参数；不可作为公共函数参数或返回值
  - 特性：`public` 的 `mapping` 自动生成 getter；嵌套 `mapping` 的 getter 支持多参数
  - 限制：无法遍历（与 `storage layout` 有关）

## 第五章 合约的调用
- **EOA (External Owned Account)**：外部账号，如 MetaMask
- 调用链：所有调用最终由 EOA 发起，合约间调用形成链条

### 合约间调用过程
#### 调用条件
- 调用者需持有被调用合约的地址
- 获取被调用合约的信息
- 将地址转换为被调用合约实例

#### 函数调用方式
1. **同一源文件内**
   - 调用者直接将地址转为合约实例
   - 使用实例调用函数
2. **不同源文件**
   - 导入被调用合约源文件
   - 调用者将地址转为合约实例
   - 使用实例调用函数
3. **通过接口调用**
   - 接口等价于合约的 ABI（签名、定义、参数、返回值）
   - 接口的定义和使用
   - 设计原则：面向接口，接口最小化

### External
- `external` 函数应仅由外部调用
- 内部调用时，仍按外部调用机制处理，生成新的 `message`（有额外成本）