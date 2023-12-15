import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://kwlydfajqnlgqirgtgze.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3bHlkZmFqcW5sZ3Fpcmd0Z3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMDI0NDksImV4cCI6MjAxNTc3ODQ0OX0.E3j5ZwZhfsVfxDrUklsacFuiqXhFfIq7F_5CVaxMXBw';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
