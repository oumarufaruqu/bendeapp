-- Enable UUID extension if not already enabled
create extension if not exists "uuid-ossp";

-- Create courses table
create table courses (
  id uuid default uuid_generate_v4() primary key,
  code text not null,
  title text not null,
  description text
);

-- Insert Academy Entrance Examination courses
insert into courses (code, title, description) values
  ('AKD101', 'Sözel Mantık', 'Sözel akıl yürütme, muhakeme ve problem çözme becerileri'),
  ('AKD102', 'Sayısal Mantık', 'Sayısal akıl yürütme, matematiksel muhakeme ve problem çözme teknikleri'),
  ('AKD103', 'Tarih', 'Türkiye Cumhuriyeti ve Atatürkçülük, İnkılap Tarihi'),
  ('AKD104', 'Türkiye Coğrafyası', 'Türkiye''nin fiziki, beşeri ve ekonomik coğrafyası'),
  ('AKD105', 'Eğitimin Temelleri', 'Eğitim bilimine giriş, öğrenme ve öğretim ilkeleri'),
  ('AKD106', 'Mevzuat', 'Eğitim hukuku ve ilgili mevzuat bilgisi'); 