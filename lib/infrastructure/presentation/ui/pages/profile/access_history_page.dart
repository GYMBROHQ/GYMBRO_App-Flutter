import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';

/// Access history entry model
class AccessHistoryEntry {
  final String gymName;
  final String time;
  final String status;
  final String device;
  final bool isSuccess;
  final String? errorMessage;

  const AccessHistoryEntry({
    required this.gymName,
    required this.time,
    required this.status,
    required this.device,
    required this.isSuccess,
    this.errorMessage,
  });
}

/// Access history page showing gym check-in and access logs
class AccessHistoryPage extends StatefulWidget {
  const AccessHistoryPage({super.key});

  @override
  State<AccessHistoryPage> createState() => _AccessHistoryPageState();
}

class _AccessHistoryPageState extends State<AccessHistoryPage> {
  final _searchController = TextEditingController();

  // Sample data
  final List<MapEntry<String, List<AccessHistoryEntry>>> _historyByDate = [
    MapEntry(
      'TODAY',
      [
        AccessHistoryEntry(
          gymName: "Gold's Gym - Downtown",
          time: '8:42 AM',
          status: 'Check-in',
          device: 'iPhone 14 Pro',
          isSuccess: true,
        ),
        AccessHistoryEntry(
          gymName: 'Spa & Sauna Zone',
          time: '7:15 AM',
          status: 'Access Granted',
          device: 'NFC Tag',
          isSuccess: true,
        ),
      ],
    ),
    MapEntry(
      'YESTERDAY',
      [
        AccessHistoryEntry(
          gymName: '24 Hour Fitness',
          time: '6:20 PM',
          status: 'Access Denied',
          device: 'QR Code',
          isSuccess: false,
          errorMessage: 'Membership Expired',
        ),
        AccessHistoryEntry(
          gymName: 'Muscle Beach',
          time: '6:30 AM',
          status: 'Check-in',
          device: 'Apple Watch',
          isSuccess: true,
        ),
      ],
    ),
    MapEntry(
      'DEC 18, 2024',
      [
        AccessHistoryEntry(
          gymName: "Gold's Gym - Downtown",
          time: '9:12 AM',
          status: 'Check-in',
          device: 'iPhone 14 Pro',
          isSuccess: true,
        ),
        AccessHistoryEntry(
          gymName: 'Pool Access',
          time: '10:45 AM',
          status: 'Access Granted',
          device: 'NFC Tag',
          isSuccess: true,
        ),
      ],
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Colors from access_history_screen design
    final backgroundColor = isDark
        ? DarkAppColors.backgroundPrimary
        : AppColors.backgroundSecondary;

    final surfaceDark = DarkAppColors.surfaceElevated1;
    final surfaceHighlight = DarkAppColors.surfaceElevated2;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor.withValues(alpha: 0.95),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Access History',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: Show options menu
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Section
          Container(
            padding: const EdgeInsets.all(16),
            color: backgroundColor,
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: surfaceDark,
                    hintText: 'Search history...',
                    hintStyle: TextStyle(
                      color: DarkAppColors.textMuted,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: DarkAppColors.textMuted,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Action Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildActionChip(
                        icon: Icons.calendar_today,
                        label: 'Filter Date',
                        surfaceDark: surfaceDark,
                        surfaceHighlight: surfaceHighlight,
                      ),
                      const SizedBox(width: 8),
                      _buildActionChip(
                        icon: Icons.bar_chart,
                        label: 'Export Log',
                        surfaceDark: surfaceDark,
                        surfaceHighlight: surfaceHighlight,
                      ),
                      const SizedBox(width: 8),
                      _buildActionChip(
                        icon: Icons.tune,
                        label: 'Type',
                        surfaceDark: surfaceDark,
                        surfaceHighlight: surfaceHighlight,
                        isActive: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // History List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 32),
              itemCount: _historyByDate.length + 1,
              itemBuilder: (context, index) {
                if (index == _historyByDate.length) {
                  // Load More Button
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: Load more history
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: surfaceDark,
                          foregroundColor: Colors.white,
                          side: BorderSide(
                            color: DarkAppColors.surfaceElevated2,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.sync,
                              size: 18,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Load More History',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                final section = _historyByDate[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: backgroundColor.withValues(alpha: 0.95),
                        border: Border(
                          bottom: BorderSide(
                            color: DarkAppColors.surfaceElevated1,
                          ),
                        ),
                      ),
                      child: Text(
                        section.key,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: DarkAppColors.textMuted,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    // Entries
                    ...section.value.map(
                      (entry) => _buildHistoryEntry(
                        entry,
                        surfaceDark: surfaceDark,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionChip({
    required IconData icon,
    required String label,
    required Color surfaceDark,
    required Color surfaceHighlight,
    bool isActive = true,
  }) {
    return Material(
      color: surfaceDark,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          // TODO: Handle chip action
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isActive
                    ? AppColors.primary500
                    : DarkAppColors.textMuted,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : DarkAppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryEntry(
    AccessHistoryEntry entry, {
    required Color surfaceDark,
  }) {
    final statusColor = entry.isSuccess
        ? AppColors.success500
        : AppColors.error500;

    return Material(
      color: entry.isSuccess
          ? Colors.transparent
          : AppColors.error500.withValues(alpha: 0.05),
      child: InkWell(
        onTap: () {
          // TODO: Show entry details
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: DarkAppColors.surfaceElevated1.withValues(alpha: 0.5),
              ),
              left: entry.isSuccess
                  ? BorderSide.none
                  : BorderSide(
                      color: AppColors.error500,
                      width: 4,
                    ),
            ),
          ),
          child: Row(
            children: [
              // Status Icon
              Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  entry.isSuccess ? Icons.check : Icons.close,
                  size: 20,
                  color: statusColor,
                ),
              ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            entry.gymName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          entry.device,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: DarkAppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${entry.time} · ${entry.status}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: DarkAppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                    if (entry.errorMessage != null) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error500.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.error,
                              size: 14,
                              color: DarkAppColors.error500,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              entry.errorMessage!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: DarkAppColors.error500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Chevron
              const Icon(
                Icons.chevron_right,
                size: 20,
                color: DarkAppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
