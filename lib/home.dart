import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final int completedCount;
  final int uncompletedCount;
  final Function(String?) onNavigateToTasks;

  const Home({
    super.key,
    required this.completedCount,
    required this.uncompletedCount,
    required this.onNavigateToTasks,
  });

  @override
  Widget build(BuildContext context) {
     
    int totalTasks = completedCount + uncompletedCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Here\'s your task summary',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            
             
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  
                  if (index == 0) {
                    return _buildSummaryListTile(
                      title: 'Total Tasks',
                      count: totalTasks,
                      color: Colors.blue,
                      icon: Icons.list,
                      onTap: null,
                    );
                  } else if (index == 1) {
                    return _buildSummaryListTile(
                      title: 'Completed',
                      count: completedCount,
                      color: Colors.green,
                      icon: Icons.check_circle,
                      onTap: () => _navigateToTasks(context, 'completed'),
                    );
                  } else {
                    return _buildSummaryListTile(
                      title: 'Pending',
                      count: uncompletedCount,
                      color: Colors.orange,
                      icon: Icons.pending,
                      onTap: () => _navigateToTasks(context, 'pending'),
                    );
                  }
                },
              ),
            ),
           ],
        ),
      ),
    );
  }
  
  Widget _buildSummaryListTile({
    required String title,
    required int count,
    required Color color,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
         
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
         
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
             if (onTap != null) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                color: color,
                size: 16,
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _navigateToTasks(BuildContext context, String filter) {
    onNavigateToTasks(filter);
  }
}
