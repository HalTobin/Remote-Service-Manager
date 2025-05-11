import 'package:flutter/material.dart';

enum ServiceIconType {
    admin(id: 1),
    public(id: 2),
    user(id: 3),
    web(id: 4),
    database(id: 5),
    mail(id: 6),
    storage(id: 7),
    compute(id: 8),
    analytics(id: 9),
    unknown(id: 10);

    final int id;

    const ServiceIconType({required this.id});

    static ServiceIconType? findById(int? id) {
        if (id != null) {
            try {
                return ServiceIconType.values.firstWhere((icon) => icon.id == id);
            } catch (_) {
                return null;
            }
        }
        else { return null; }
    }
}

extension ServiceIconData on ServiceIconType {
    IconData get icon {
        switch (this) {
            case ServiceIconType.admin:
                return Icons.admin_panel_settings;
            case ServiceIconType.public:
                return Icons.public;
            case ServiceIconType.user:
                return Icons.person;
            case ServiceIconType.web:
                return Icons.language;
            case ServiceIconType.database:
                return Icons.storage;
            case ServiceIconType.mail:
                return Icons.email;
            case ServiceIconType.storage:
                return Icons.sd_storage;
            case ServiceIconType.compute:
                return Icons.memory;
            case ServiceIconType.analytics:
                return Icons.bar_chart;
            case ServiceIconType.unknown:
                return Icons.help_outline;
        }
    }

    String get label {
        return toString().split('.').last;
    }
}