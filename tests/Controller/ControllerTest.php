<?php

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\JsonResponse;

class ControllerTest extends WebTestCase
{
    /**
     * @dataProvider provideUrls
     * @param string $method
     * @param string $url
     * @param int|null $parameter
     * @param string|null $content
     */
    public function testRequestIsSuccessful(string $method, string $url, ?int $parameter, ?string $content){
        $client = self::createClient();
        $client->request($method, $url . $parameter ?? '', [], [], [], $content);

        $this->assertInstanceOf(JsonResponse::class, $client->getResponse());
        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertTrue($client->getResponse()->isSuccessful());
    }

    public function provideUrls(): array
    {
        return [
            ['GET', '/user/top', null, null],
            ['GET', '/ticket/', 1, null],
            ['POST', '/ticket', null, '{"bets": [{"amount": 1.5,"type": "straight"}, {"amount": 2,"type": "split"}]}'],
            ['PATCH', '/user/', 1, '{"user": {"username":"testuser", "password":"xGfdsek20g"}}']
        ];
    }
}