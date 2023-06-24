import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseCredentials {
  static const String API_KEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl2ZXh1YXh0YmRxaGh6enNiaGxmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODc2MjUxMTMsImV4cCI6MjAwMzIwMTExM30.U24t7WZgjDQll1xfyXZiLBlMXkV_7-jv4WS24ESeVEM";
  static const String API_URL = "https://yvexuaxtbdqhhzzsbhlf.supabase.co";

  SupabaseClient supabaseClient = SupabaseClient(API_URL, API_KEY);
}
