import os
import sys
import docx
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.oxml import parse_xml, OxmlElement
from docx.oxml.ns import nsdecls, qn

def set_cell_background(cell, fill_hex):
    tcPr = cell._tc.get_or_add_tcPr()
    shd = parse_xml(f'<w:shd {nsdecls("w")} w:fill="{fill_hex}"/>')
    tcPr.append(shd)

def set_cell_margins(cell, top=100, bottom=100, left=150, right=150):
    tcPr = cell._tc.get_or_add_tcPr()
    tcMar = parse_xml(
        f'<w:tcMar {nsdecls("w")}>'
        f'<w:top w:w="{top}" w:type="dxa"/>'
        f'<w:bottom w:w="{bottom}" w:type="dxa"/>'
        f'<w:left w:w="{left}" w:type="dxa"/>'
        f'<w:right w:w="{right}" w:type="dxa"/>'
        f'</w:tcMar>'
    )
    tcPr.append(tcMar)

def add_code_block(doc, code_text):
    table = doc.add_table(rows=1, cols=1)
    table.alignment = WD_TABLE_ALIGNMENT.CENTER
    table.autofit = False
    
    cell = table.cell(0, 0)
    cell.width = Inches(6.5)
    set_cell_background(cell, "F4F6F8")
    set_cell_margins(cell, top=120, bottom=120, left=180, right=180)
    
    p = cell.paragraphs[0]
    p.paragraph_format.space_before = Pt(0)
    p.paragraph_format.space_after = Pt(0)
    p.paragraph_format.line_spacing = 1.15
    
    run = p.add_run(code_text.strip())
    run.font.name = 'Consolas'
    run.font.size = Pt(8.5)
    run.font.color.rgb = RGBColor(0x24, 0x29, 0x2E)

def build_report():
    doc = docx.Document()
    
    # Page setup - Margins 1 inch
    sections = doc.sections
    for section in sections:
        section.top_margin = Inches(1.0)
        section.bottom_margin = Inches(1.0)
        section.left_margin = Inches(1.0)
        section.right_margin = Inches(1.0)
        
    # Styles
    normal_style = doc.styles['Normal']
    normal_style.font.name = 'Times New Roman'
    normal_style.font.size = Pt(11)
    normal_style.font.color.rgb = RGBColor(0x1A, 0x1A, 0x1A)
    
    # ------------------ COVER / HEADER ------------------
    p_header = doc.add_paragraph()
    p_header.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_header.paragraph_format.space_after = Pt(4)
    r = p_header.add_run("LAPORAN PRAKTIKUM DATA STORAGE (1)\n")
    r.bold = True
    r.font.size = Pt(14)
    r2 = p_header.add_run("PEMROGRAMAN PERANGKAT BERGERAK (CCK3AAB3)\n")
    r2.bold = True
    r2.font.size = Pt(13)
    r3 = p_header.add_run('WEEK 09 ["CONSUME REST API SUPABASE DENGAN FLUTTER"]\n')
    r3.bold = True
    r3.font.size = Pt(12)
    r3.font.color.rgb = RGBColor(0x99, 0x00, 0x00)
    
    p_sub = doc.add_paragraph()
    p_sub.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_sub.paragraph_format.space_after = Pt(16)
    
    # Info Box Table
    info_table = doc.add_table(rows=6, cols=3)
    info_table.alignment = WD_TABLE_ALIGNMENT.CENTER
    info_data = [
        ("Nama Mahasiswa", ":", "Haryanto Wifakul Azmi"),
        ("NIM", ":", "103122400037"),
        ("Kelas", ":", "SE-08-02"),
        ("Dosen Pengampu", ":", "Yudha Islami Sulistya, S.Kom., M.Cs. [YIS]"),
        ("Program Studi", ":", "S1 Software Engineering (Rekayasa Perangkat Lunak)"),
        ("Institusi", ":", "Fakultas Informatika - Telkom University Purwokerto")
    ]
    for row_idx, (col1, col2, col3) in enumerate(info_data):
        row = info_table.rows[row_idx]
        cell_1, cell_2, cell_3 = row.cells[0], row.cells[1], row.cells[2]
        
        cell_1.width = Inches(1.8)
        cell_2.width = Inches(0.2)
        cell_3.width = Inches(4.5)
        
        p1 = cell_1.paragraphs[0]
        p1.paragraph_format.space_before = Pt(2)
        p1.paragraph_format.space_after = Pt(2)
        r = p1.add_run(col1)
        r.bold = True
        r.font.size = Pt(10)
        
        p2 = cell_2.paragraphs[0]
        p2.paragraph_format.space_before = Pt(2)
        p2.paragraph_format.space_after = Pt(2)
        p2.add_run(col2).font.size = Pt(10)
        
        p3 = cell_3.paragraphs[0]
        p3.paragraph_format.space_before = Pt(2)
        p3.paragraph_format.space_after = Pt(2)
        r3 = p3.add_run(col3)
        r3.font.size = Pt(10)
        if row_idx in [0, 1]:
            r3.bold = True

    doc.add_paragraph().paragraph_format.space_after = Pt(8)
    
    # ------------------ BAB I: TUJUAN & SOAL ------------------
    h1 = doc.add_heading("A. TUJUAN & SOAL PRAKTIKUM", level=1)
    h1.paragraph_format.space_before = Pt(12)
    h1.paragraph_format.space_after = Pt(6)
    
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(6)
    p.add_run(
        "Berdasarkan instruksi pada Learning Management System (LMS) CeLOE Telkom University "
        "pada mata kuliah Pemrograman Perangkat Bergerak (Week 09 Data Storage 1 - Tugas Supabase Consume):\n"
    )
    p_quote = doc.add_paragraph()
    p_quote.paragraph_format.left_indent = Inches(0.4)
    p_quote.paragraph_format.space_after = Pt(8)
    r_q = p_quote.add_run('"Pada Materi supabase consume, silahkan di kerjakan step by step dan hasilnya dalam bentuk PDF."')
    r_q.italic = True
    r_q.bold = True

    p_tujuan = doc.add_paragraph()
    p_tujuan.paragraph_format.line_spacing = 1.15
    p_tujuan.paragraph_format.space_after = Pt(8)
    p_tujuan.add_run(
        "Tujuan praktikum ini adalah membangun aplikasi to-do list berbasis Flutter yang menerapkan "
        "arsitektur Simplified MVC (Service Layer) dan terhubung langsung ke database PostgreSQL Supabase "
        "melalui antarmuka PostgREST API (CRUD: Create, Read, Update, Delete) menggunakan library HTTP Dio."
    )

    # ------------------ BAB II: DASAR TEORI & ARSITEKTUR ------------------
    h2 = doc.add_heading("B. DASAR TEORI & ARSITEKTUR SISTEM", level=1)
    h2.paragraph_format.space_before = Pt(12)
    h2.paragraph_format.space_after = Pt(6)

    p_ars = doc.add_paragraph()
    p_ars.paragraph_format.line_spacing = 1.15
    p_ars.paragraph_format.space_after = Pt(6)
    p_ars.add_run(
        "Aplikasi dirancang menggunakan arsitektur Simplified MVC dengan Service Layer yang rapi untuk "
        "menjaga prinsip separation of concerns (pemisahan tanggung jawab), terdiri dari:\n"
    )

    layers = [
        ("1. Presentation Layer (lib/pages/todo_page.dart): ", "Menyediakan antarmuka visual (UI) pengguna, merender daftar tugas, menangani interaksi pengguna (tap, toggle, dialog tambah data, dan delete), serta merebuild UI berdasarkan state controller."),
        ("2. Controller Layer (lib/controllers/todo_controller.dart): ", "Menjadi penghubung antara UI dan Service Layer, mengelola local state (list todos, status isLoading, errorMessage), dan mengeksekusi logika bisnis tanpa menangani styling UI."),
        ("3. Service Layer (lib/services/todo_service.dart): ", "Mengelola seluruh komunikasi jaringan HTTP/REST API ke endpoint Supabase menggunakan Dio, menyematkan apikey dan Authorization token, serta melakukan serialisasi/deserialisasi JSON ke Model."),
        ("4. Domain / Model Layer (lib/models/todo_model.dart): ", "Mendefinisikan entitas data Todo (id, name, description, isDone) beserta method factory fromJson dan toJson."),
        ("5. Environment Config (lib/env/env_config.dart & assets/.env): ", "Menyimpan kredensial sensitif seperti Supabase Project URL dan Anon Key secara aman menggunakan library flutter_dotenv.")
    ]
    for bold_prefix, desc in layers:
        p_l = doc.add_paragraph(style='List Bullet')
        p_l.paragraph_format.line_spacing = 1.15
        p_l.paragraph_format.space_after = Pt(4)
        r_b = p_l.add_run(bold_prefix)
        r_b.bold = True
        p_l.add_run(desc)

    # ------------------ BAB III: LANGKAH PENGERJAAN & SOURCE CODE ------------------
    h3 = doc.add_heading("C. LANGKAH-LANGKAH PENGERJAAN & IMPLEMENTASI KODE", level=1)
    h3.paragraph_format.space_before = Pt(12)
    h3.paragraph_format.space_after = Pt(6)

    # Langkah 1
    doc.add_heading("1. Konfigurasi Dependencies (pubspec.yaml)", level=2)
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(4)
    p.add_run("Menambahkan library dio untuk HTTP client dan flutter_dotenv untuk konfigurasi file environment di pubspec.yaml:")
    add_code_block(doc, """dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  dio: ^5.11.1
  flutter_dotenv: ^6.0.1

flutter:
  uses-material-design: true
  assets:
    - assets/.env""")

    # Langkah 2
    doc.add_heading("2. Konfigurasi Environment (assets/.env & lib/env/env_config.dart)", level=2)
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(4)
    p.add_run("Menyimpan URL proyek Supabase dan Public Anon Key pada file assets/.env:")
    add_code_block(doc, """SUPABASE_URL=https://qjujyqvkrdqhbiqfdchg.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_TODOS_TABLE=todos""")

    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(4)
    p.add_run("Membaca konfigurasi environment secara terpusat pada file lib/env/env_config.dart:")
    add_code_block(doc, """import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get todosTable => dotenv.env['SUPABASE_TODOS_TABLE'] ?? 'todos';
}""")

    # Langkah 3
    doc.add_heading("3. Model Layer (lib/models/todo_model.dart)", level=2)
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(4)
    p.add_run("Membuat representasi data todo beserta parsing JSON dari Supabase:")
    add_code_block(doc, """class TodoModel {
  final int id;
  final String name;
  final String description;
  final bool isDone;

  TodoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isDone,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      isDone: json['is_done'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'is_done': isDone,
    };
  }
}""")

    # Langkah 4
    doc.add_heading("4. Service Layer (lib/services/todo_service.dart)", level=2)
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(4)
    p.add_run("Mengimplementasikan request HTTP REST API (GET, POST, PATCH, DELETE) menggunakan Dio:")
    add_code_block(doc, """import 'package:dio/dio.dart';
import '../env/env_config.dart';
import '../models/todo_model.dart';

class TodoApiService {
  final String _baseUrl = EnvConfig.supabaseUrl;
  final String _anonKey = EnvConfig.supabaseAnonKey;
  final String _table = EnvConfig.todosTable;

  late final Dio _dio;

  TodoApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          'apikey': _anonKey,
          'Authorization': 'Bearer $_anonKey',
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  /// GET /rest/v1/todos?select=*
  Future<List<TodoModel>> fetchTodos() async {
    final response = await _dio.get(
      '/rest/v1/$_table',
      queryParameters: {'select': '*'},
    );
    final data = response.data as List<dynamic>;
    return data.map((e) => TodoModel.fromJson(e)).toList();
  }

  /// POST /rest/v1/todos
  Future<TodoModel> addTodo({required String name, required String description}) async {
    final response = await _dio.post(
      '/rest/v1/$_table',
      data: {'name': name, 'description': description, 'is_done': false},
      options: Options(headers: {'Prefer': 'return=representation'}),
    );
    final list = response.data as List<dynamic>;
    return TodoModel.fromJson(list.first);
  }

  /// PATCH /rest/v1/todos?id=eq.<id>
  Future<TodoModel> toggleTodo(int id, bool isDone) async {
    final response = await _dio.patch(
      '/rest/v1/$_table',
      queryParameters: {'id': 'eq.$id'},
      data: {'is_done': isDone},
      options: Options(headers: {'Prefer': 'return=representation'}),
    );
    final list = response.data as List<dynamic>;
    return TodoModel.fromJson(list.first);
  }

  /// DELETE /rest/v1/todos?id=eq.<id>
  Future<void> deleteTodo(int id) async {
    await _dio.delete(
      '/rest/v1/$_table',
      queryParameters: {'id': 'eq.$id'},
    );
  }
}""")

    # Langkah 5
    doc.add_heading("5. Controller Layer (lib/controllers/todo_controller.dart)", level=2)
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(4)
    p.add_run("Mengatur state lokal aplikasi (loading, error, dan list data):")
    add_code_block(doc, """import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoController {
  final TodoApiService _service;
  TodoController(this._service);

  List<TodoModel> todos = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadTodos() async {
    isLoading = true;
    errorMessage = null;
    try {
      todos = await _service.fetchTodos();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  Future<void> addTodo(String name, String description) async {
    isLoading = true;
    try {
      final newTodo = await _service.addTodo(name: name, description: description);
      todos.add(newTodo);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  Future<void> toggleTodoDone(TodoModel todo) async {
    isLoading = true;
    try {
      final updated = await _service.toggleTodo(todo.id, !todo.isDone);
      final index = todos.indexWhere((t) => t.id == todo.id);
      if (index != -1) todos[index] = updated;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    isLoading = true;
    try {
      await _service.deleteTodo(todo.id);
      todos.removeWhere((t) => t.id == todo.id);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}""")

    # ------------------ BAB IV: HASIL & PENGUJIAN OUTPUT ------------------
    doc.add_page_break()
    h4 = doc.add_heading("D. HASIL DAN SCREENSHOT PENGUJIAN SISTEM", level=1)
    h4.paragraph_format.space_before = Pt(12)
    h4.paragraph_format.space_after = Pt(8)
    h4.paragraph_format.keep_with_next = True

    from PIL import Image
    temp_dir = os.environ.get('TEMP', r'C:\Users\hary\AppData\Local\Temp')
    
    def get_cropped_image(src_path, filename):
        if not os.path.exists(src_path):
            return None
        im = Image.open(src_path)
        # Crop from y=0 to y=680 to focus on Header + List items without empty bottom whitespace
        crop_h = min(im.height, 680)
        cropped = im.crop((0, 0, im.width, crop_h))
        dest = os.path.join(temp_dir, filename)
        cropped.save(dest)
        return dest

    img1_cropped = get_cropped_image(r'C:\Users\hary\OneDrive\Pictures\Screenshots\Screenshot 2026-11-13 011222.png', 'crop_1.png')
    img2_cropped = get_cropped_image(r'C:\Users\hary\OneDrive\Pictures\Screenshots\Screenshot 2026-11-13 011319.png', 'crop_2.png')
    img3_cropped = get_cropped_image(r'C:\Users\hary\OneDrive\Pictures\Screenshots\Screenshot 2026-11-13 011326.png', 'crop_3.png')

    # Pengujian 1
    h4_1 = doc.add_heading("1. Pengujian Read / Fetch Data dari Supabase (GET)", level=2)
    h4_1.paragraph_format.keep_with_next = True
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(6)
    p.paragraph_format.keep_with_next = True
    p.add_run(
        "Aplikasi dijalankan pada browser lokal (Flutter Web). Saat initState() dieksekusi, controller "
        "memanggil fetchTodos() ke endpoint REST Supabase. Data yang tersimpan di tabel PostgreSQL berhasil diambil "
        "dan dirender secara dinamis ke dalam ListView:"
    )
    if img1_cropped:
        p_img1 = doc.add_paragraph()
        p_img1.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_img1.paragraph_format.space_before = Pt(4)
        p_img1.paragraph_format.space_after = Pt(2)
        p_img1.paragraph_format.keep_with_next = True
        p_img1.add_run().add_picture(img1_cropped, width=Inches(3.8))
        
        p_cap1 = doc.add_paragraph()
        p_cap1.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_cap1.paragraph_format.space_after = Pt(14)
        p_cap1.paragraph_format.keep_with_next = True
        r = p_cap1.add_run("Gambar 1: Tampilan Read / Fetch Data Todo dari Supabase (GET)")
        r.italic = True
        r.font.size = Pt(9.5)

    # Pengujian 2
    h4_2 = doc.add_heading("2. Pengujian Update / Toggle Status Selesai (PATCH)", level=2)
    h4_2.paragraph_format.keep_with_next = True
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(6)
    p.paragraph_format.keep_with_next = True
    p.add_run(
        "Ketika pengguna melakukan tap pada salah satu todo ('Test Task'), controller mengirimkan request PATCH "
        "dengan parameter query id=eq.1 dan payload data {'is_done': true}. Status berhasil diperbarui di database "
        "Supabase, sehingga tampilan UI seketika berubah menampilkan ikon lingkaran centang dan efek coretan (strikethrough):"
    )
    if img2_cropped:
        p_img2 = doc.add_paragraph()
        p_img2.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_img2.paragraph_format.space_before = Pt(4)
        p_img2.paragraph_format.space_after = Pt(2)
        p_img2.paragraph_format.keep_with_next = True
        p_img2.add_run().add_picture(img2_cropped, width=Inches(3.8))
        
        p_cap2 = doc.add_paragraph()
        p_cap2.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_cap2.paragraph_format.space_after = Pt(14)
        p_cap2.paragraph_format.keep_with_next = True
        r = p_cap2.add_run("Gambar 2: Pengujian Update / Toggle Status Selesai Todo (PATCH)")
        r.italic = True
        r.font.size = Pt(9.5)

    # Pengujian 3
    h4_3 = doc.add_heading("3. Pengujian Delete Data Todo (DELETE)", level=2)
    h4_3.paragraph_format.keep_with_next = True
    p = doc.add_paragraph()
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(6)
    p.paragraph_format.keep_with_next = True
    p.add_run(
        "Ketika pengguna memilih aksi 'Delete' pada item 'Check Automated', aplikasi mengirimkan HTTP DELETE "
        "ke Supabase dengan filter query id=eq.<id>. Supabase mengembalikan kode status 204 No Content, dan "
        "controller memperbarui state lokal dengan menghapus item tersebut dari daftar tampilan:"
    )
    if img3_cropped:
        p_img3 = doc.add_paragraph()
        p_img3.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_img3.paragraph_format.space_before = Pt(4)
        p_img3.paragraph_format.space_after = Pt(2)
        p_img3.paragraph_format.keep_with_next = True
        p_img3.add_run().add_picture(img3_cropped, width=Inches(3.8))
        
        p_cap3 = doc.add_paragraph()
        p_cap3.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p_cap3.paragraph_format.space_after = Pt(14)
        r = p_cap3.add_run("Gambar 3: Pengujian Delete Data Todo dari Database Supabase (DELETE)")
        r.italic = True
        r.font.size = Pt(9.5)

    # ------------------ BAB V: KESIMPULAN ------------------
    h5 = doc.add_heading("E. KESIMPULAN", level=1)
    h5.paragraph_format.space_before = Pt(12)
    h5.paragraph_format.space_after = Pt(6)

    p_kesimpulan = doc.add_paragraph()
    p_kesimpulan.paragraph_format.line_spacing = 1.15
    p_kesimpulan.paragraph_format.space_after = Pt(6)
    p_kesimpulan.add_run(
        "Berdasarkan praktikum Week 09 Data Storage (1) yang telah diselesaikan:\n"
    )
    points = [
        "Penerapan arsitektur Simplified MVC dengan Service Layer terbukti mempermudah pengelolaan kode, di mana tanggung jawab antara UI, State Management, dan Jaringan HTTP terpisah secara bersih dan modular.",
        "Supabase PostgREST API mempermudah integrasi database PostgreSQL ke dalam aplikasi mobile Flutter tanpa perlu membuat server backend custom secara manual.",
        "Pengujian fungsionalitas CRUD (Create, Read, Update, Delete) berhasil dilakukan secara menyeluruh dengan status koneksi database yang stabil dan responsif."
    ]
    for pt in points:
        p_pt = doc.add_paragraph(style='List Bullet')
        p_pt.paragraph_format.line_spacing = 1.15
        p_pt.paragraph_format.space_after = Pt(4)
        p_pt.add_run(pt)

    # Simpan file DOCX
    out_dir = r"D:\Kampus\Tugas_S5\PPB\103122400037_Haryantowifakulazmi_ppb-se-08-2\teori\week-09-data-storage-1"
    docx_filename = "Tugas_Week_09_Supabase_Consume_Haryanto Wifakul Azmi_103122400037.docx"
    docx_path = os.path.join(out_dir, docx_filename)
    doc.save(docx_path)
    print("DOCX successfully generated at:", docx_path)
    return docx_path

if __name__ == "__main__":
    build_report()
