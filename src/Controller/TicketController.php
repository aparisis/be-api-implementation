<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class UserController extends AbstractController
{
    /**
     * @Route("/ticket/{id}", name="get_ticket", requirements={"id"="\d+"})
     */
    public function read(int $id): JsonResponse
    {
        return new JsonResponse([]);
    }
}
