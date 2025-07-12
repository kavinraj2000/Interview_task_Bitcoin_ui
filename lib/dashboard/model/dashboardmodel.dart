class DashboardModel {
  final String userName;
  final String avatarUrl;
  final double totalBalance;
  final double changeAmount;
  final double changePercentage;
  final bool isPositive;
  final List<CryptoAsset> cryptoAssets;
  final List<MarketStat> marketStats;

  DashboardModel({
    required this.userName,
    required this.avatarUrl,
    required this.totalBalance,
    required this.changeAmount,
    required this.changePercentage,
    required this.isPositive,
    required this.cryptoAssets,
    required this.marketStats,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      userName: json['user']['name'] ?? '',
      avatarUrl: json['user']['avatarUrl'] ?? '',
      totalBalance: (json['portfolio']['totalBalance'] as num).toDouble(),
      changeAmount: (json['portfolio']['changeAmount'] as num).toDouble(),
      changePercentage: (json['portfolio']['changePercentage'] as num).toDouble(),
      isPositive: json['portfolio']['isPositive'] ?? true,
      cryptoAssets: (json['cryptoAssets'] as List<dynamic>? ?? []).map((e) => CryptoAsset.fromJson(e)).toList(),
      marketStats: (json['marketStats'] as List<dynamic>? ?? []).map((e) => MarketStat.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'DashboardModel(userName: $userName, totalBalance: $totalBalance, changeAmount: $changeAmount, changePercentage: $changePercentage, isPositive: $isPositive, cryptoAssets: ${cryptoAssets.length}, marketStats: ${marketStats.length})';
  }
}

class CryptoAsset {
  final String name;
  final String symbol;
  final double amount;
  final double changePercentage;
  final String iconUrl;

  CryptoAsset({
    required this.name,
    required this.symbol,
    required this.amount,
    required this.changePercentage,
    required this.iconUrl,
  });

  factory CryptoAsset.fromJson(Map<String, dynamic> json) {
    return CryptoAsset(
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      amount: (json['amount'] as num).toDouble(),
      changePercentage: (json['changePercentage'] as num).toDouble(),
      iconUrl: json['iconUrl'] ?? '',
    );
  }
}

class MarketStat {
  final String name;
  final String symbol;
  final double price;
  final double changePercentage;
  final String iconUrl;

  MarketStat({
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercentage,
    required this.iconUrl,
  });

  factory MarketStat.fromJson(Map<String, dynamic> json) {
    return MarketStat(
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      price: (json['price'] as num).toDouble(),
      changePercentage: (json['changePercentage'] as num).toDouble(),
      iconUrl: json['iconUrl'] ?? '',
    );
  }
}
