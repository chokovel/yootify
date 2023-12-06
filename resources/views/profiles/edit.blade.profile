@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ __('Edit Profile') }}</div>

                    <div class="card-body">
                        <form method="POST" action="{{ route('profile.update') }}">
                            @csrf
                            @method('PUT')

                            <div class="form-group row">
                                <label for="bio" class="col-md-4 col-form-label text-md-right">{{ __('Bio') }}</label>

                                <div class="col-md-6">
                                    <textarea id="bio" name="bio" class="form-control">{{ old('bio', $profile->bio) }}</textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="education" class="col-md-4 col-form-label text-md-right">{{ __('Education') }}</label>

                                <div class="col-md-6">
                                    <input id="education" type="text" class="form-control" name="education" value="{{ old('education', $profile->education) }}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="industry" class="col-md-4 col-form-label text-md-right">{{ __('Industry') }}</label>

                                <div class="col-md-6">
                                    <select id="industry" name="industry" class="form-control">
                                        <!-- Add your industry options dynamically if needed -->
                                        <option value="Technology" {{ old('industry', $profile->industry) === 'Technology' ? 'selected' : '' }}>Technology</option>
                                        <option value="Finance" {{ old('industry', $profile->industry) === 'Finance' ? 'selected' : '' }}>Finance</option>
                                        <!-- Add more industry options as needed -->
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="skills" class="col-md-4 col-form-label text-md-right">{{ __('Skills') }}</label>

                                <div class="col-md-6">
                                    <select id="skills" name="skills[]" class="form-control select2" multiple="multiple">
                                        <!-- Skills will be dynamically populated based on the selected industry -->
                                        @foreach($skills as $skill)
                                            <option value="{{ $skill }}" {{ in_array($skill, old('skills', explode(',', $profile->skills))) ? 'selected' : '' }}>{{ $skill }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="expertise" class="col-md-4 col-form-label text-md-right">{{ __('Expertise') }}</label>

                                <div class="col-md-6">
                                    <select id="expertise" name="expertise[]" class="form-control select2" multiple="multiple">
                                        <!-- Expertise will be dynamically populated based on the selected industry -->
                                        @foreach($expertise as $expertiseItem)
                                            <option value="{{ $expertiseItem }}" {{ in_array($expertiseItem, old('expertise', explode(',', $profile->expertise))) ? 'selected' : '' }}>{{ $expertiseItem }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="entrepreneurial_interests" class="col-md-4 col-form-label text-md-right">{{ __('Entrepreneurial Interests') }}</label>

                                <div class="col-md-6">
                                    <input id="entrepreneurial_interests" type="text" class="form-control" name="entrepreneurial_interests" value="{{ old('entrepreneurial_interests', $profile->entrepreneurial_interests) }}">
                                </div>
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('Update Profile') }}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        //
    </script>
@endpush
