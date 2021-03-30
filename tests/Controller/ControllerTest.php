<?php

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\JsonResponse;

class ControllerTest extends WebTestCase
{
    /**
     * @dataProvider provideGetUrls
     * @param string $url
     * @param int|null $parameter
     */
    public function testGetRequestIsSuccessful(string $url, ?int $parameter){
        $client = self::createClient();
        $client->request('GET', $url.$parameter ?? '');
        
        $this->assertTrue($client->getResponse()->isSuccessful());
        $this->assertInstanceOf(JsonResponse::class, $client->getResponse());
        $this->assertEquals(200, $client->getResponse()->getStatusCode());
    }

    public function provideGetUrls(): array
    {
        return [
            ['/user/top', null],
            ['/ticket/', 1]
        ];
    }
}