<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Blog;
use App\Models\BlogCategory;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class BlogFeatureTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test blog post can be created
     */
    public function test_blog_post_can_be_created()
    {
        $category = BlogCategory::factory()->create();
        
        $blog = Blog::create([
            'page_title' => 'New Blog Post',
            'slug' => 'new-blog-post',
            'meta_description' => 'This is the content',
            'category_id' => $category->id,
            'status' => 1,
        ]);

        $this->assertDatabaseHas('blogs', [
            'page_title' => 'New Blog Post',
            'status' => 1,
        ]);
    }

    /**
     * Test blog post can be edited
     */
    public function test_blog_post_can_be_edited()
    {
        $blog = Blog::factory()->create();

        $blog->update(['page_title' => 'Updated Title']);

        $this->assertEquals('Updated Title', $blog->fresh()->page_title);
    }

    /**
     * Test blog posts can be filtered by category
     */
    public function test_blog_posts_can_be_filtered_by_category()
    {
        $category1 = BlogCategory::factory()->create();
        $category2 = BlogCategory::factory()->create();
        
        Blog::factory(3)->create([
            'category_id' => $category1->id,
            'status' => 'published'
        ]);
        Blog::factory(2)->create([
            'category_id' => $category2->id,
            'status' => 'published'
        ]);

        $this->assertEquals(3, Blog::where('category_id', $category1->id)->count());
    }

    /**
     * Test published blogs filter
     */
    public function test_published_blogs_filter()
    {
        Blog::factory(5)->create(['status' => 'published']);
        Blog::factory(2)->create(['status' => 'draft']);

        $this->assertEquals(5, Blog::where('status', 'published')->count());
    }

    /**
     * Test blog post can be deleted
     */
    public function test_blog_post_can_be_deleted()
    {
        $blog = Blog::factory()->create();
        $blogId = $blog->id;

        $blog->delete();

        $this->assertDatabaseMissing('blogs', ['id' => $blogId]);
    }

    /**
     * Test blog post belongs to category
     */
    public function test_blog_post_belongs_to_category()
    {
        $category = BlogCategory::factory()->create();
        $blog = Blog::factory()->create(['category_id' => $category->id]);

        $this->assertTrue($blog->category()->exists());
        $this->assertEquals($category->id, $blog->category->id);
    }
}
