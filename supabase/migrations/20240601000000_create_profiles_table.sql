-- Create profiles table
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  email TEXT NOT NULL,
  display_name TEXT,
  profile_image_url TEXT,
  current_vdot DOUBLE PRECISION,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  is_deleted BOOLEAN DEFAULT false NOT NULL
);

-- Enable Row Level Security
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Create policies
-- Allow users to view their own profile
CREATE POLICY "Users can view own profile" 
  ON public.profiles 
  FOR SELECT 
  USING (auth.uid() = id);

-- Allow users to insert their own profile
CREATE POLICY "Users can insert own profile" 
  ON public.profiles 
  FOR INSERT 
  WITH CHECK (auth.uid() = id);

-- Allow users to update their own profile
CREATE POLICY "Users can update own profile" 
  ON public.profiles 
  FOR UPDATE 
  USING (auth.uid() = id);

-- Create function to handle user creation
CREATE OR REPLACE FUNCTION public.handle_new_user() 
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, display_name)
  VALUES (new.id, new.email, new.raw_user_meta_data->>'full_name');
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger to automatically create profile when a new user signs up
CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Create vdot_scores table
CREATE TABLE IF NOT EXISTS public.vdot_scores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES public.profiles(id) NOT NULL,
  score DOUBLE PRECISION NOT NULL,
  race_distance DOUBLE PRECISION NOT NULL,
  race_time DOUBLE PRECISION NOT NULL,
  assessment_date TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);

-- Enable Row Level Security
ALTER TABLE public.vdot_scores ENABLE ROW LEVEL SECURITY;

-- Create policies
-- Allow users to view their own VDOT scores
CREATE POLICY "Users can view own VDOT scores" 
  ON public.vdot_scores 
  FOR SELECT 
  USING (auth.uid() = user_id);

-- Allow users to insert their own VDOT scores
CREATE POLICY "Users can insert own VDOT scores" 
  ON public.vdot_scores 
  FOR INSERT 
  WITH CHECK (auth.uid() = user_id);

-- Allow users to update their own VDOT scores
CREATE POLICY "Users can update own VDOT scores" 
  ON public.vdot_scores 
  FOR UPDATE 
  USING (auth.uid() = user_id);

-- Allow users to delete their own VDOT scores
CREATE POLICY "Users can delete own VDOT scores" 
  ON public.vdot_scores 
  FOR DELETE 
  USING (auth.uid() = user_id);