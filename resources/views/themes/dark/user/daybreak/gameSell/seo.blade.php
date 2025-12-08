@extends(template().'layouts.user')
@section('title',trans('Sell Post SEO'))

@section('content')
    <div class="container">
        <div class="row">
            <div class="pagetitle mt-20">
                <h4 class="mb-1">@lang('Sell Post SEO')</h4>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('user.dashboard') }}">@lang('Home')</a></li>
                        <li class="breadcrumb-item active">@lang('SEO')</li>
                    </ol>
                </nav>
            </div>
            <div class="row g-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header pb-0 border-0">
                            <h4>@lang($sellPost->title . ' Page SEO')</h4>
                        </div>
                        <form action="{{route('user.sellPostSeo',$sellPost->id)}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label for="price" class="form-label">@lang('Meta Title')</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            name="meta_title"
                                            value="{{old('meta_title',$sellPost->meta_title)}}"
                                            id="exampleFormControlInput1"
                                            placeholder="@lang("Meta Title")"
                                        />
                                        @if($errors->has('meta_title'))
                                            <div
                                                class="error text-danger">@lang($errors->first('meta_title')) </div>
                                        @endif
                                    </div>

                                    <div class="col-12">
                                        <label for="price" class="form-label">@lang('Meta Keywords')</label>
                                        <select name="meta_keywords[]" class="form-select select2-tags" multiple>
                                            @if($sellPost->meta_keywords)
                                                @foreach($sellPost->meta_keywords as $key => $data)
                                                    <option value="@lang($data)" selected>@lang($data)</option>
                                                @endforeach
                                            @endif
                                        </select>
                                        @if($errors->has('meta_keywords'))
                                            <div
                                                class="error text-danger">@lang($errors->first('meta_keywords')) </div>
                                        @endif
                                    </div>

                                    <div class="col-12">
                                        <label for="Comments" class="form-label">@lang('Meta Description')</label>
                                        <textarea
                                            class="form-control"
                                            name="meta_description"
                                            id="exampleFormControlTextarea1"
                                            rows="5"
                                            placeholder="Meta Description"
                                        >{{old('details',$sellPost->meta_description)}}</textarea>
                                        @if($errors->has('meta_description'))
                                            <div
                                                class="error text-danger">@lang($errors->first('meta_description')) </div>
                                        @endif
                                    </div>

                                    <div class="col-12">
                                        <label for="Comments" class="form-label">@lang('OG Description')</label>
                                        <textarea
                                            class="form-control"
                                            name="og_description"
                                            id="exampleFormControlTextarea1"
                                            rows="5"
                                            placeholder="OG Description"
                                        >{{old('details',$sellPost->og_description)}}</textarea>
                                        @if($errors->has('og_description'))
                                            <div
                                                class="error text-danger">@lang($errors->first('og_description')) </div>
                                        @endif
                                    </div>

                                    <div class="col-sm-12 col-md-4 image-column">
                                        <div class="profile-details-section">
                                            <div class="d-flex gap-3 align-items-center">
                                                <div class="image-area" style="max-width: 50% !important;">
                                                    <img id="profile-img"
                                                         src="{{getFile($sellPost->meta_image_driver,$sellPost->meta_image)}}"
                                                         alt="...">
                                                </div>
                                                <div class="btn-area">
                                                    <div class="btn-area-inner d-flex">
                                                        <div class="cmn-file-input">
                                                            <label for="formFile"
                                                                   class="form-label">@lang('Upload')</label>
                                                            <input class="form-control" name="meta_image" type="file"
                                                                   id="formFile" onchange="previewImage('profile-img')">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" class="cmn-btn mt-30">@lang('Save Changes')</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('style')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
@endpush

@push('script')
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        "use strict";

        const originalImageSrc = document.getElementById('profile-img').src;
        const previewImage = (id) => {
            document.getElementById(id).src = URL.createObjectURL(event.target.files[0]);
        };

        $(document).ready(function() {
            $('.select2-tags').select2({
                tags: true,                // allow new tags
                tokenSeparators: [','],    // separate by comma
                placeholder: "Add keywords",
                width: '100%'
            });
        });

    </script>
@endpush
