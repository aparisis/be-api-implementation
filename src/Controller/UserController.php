<?php
namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class UserController extends AbstractController
{
    /**
     * @Route("/user/{id}", name="update_user", methods={"PATCH"}, requirements={"id"="\d+"})
     */
    public function update(int $id): JsonResponse
    {
        return new JsonResponse([]);
    }

    /**
     * @Route("/user/top", name="get_top_winners", methods={"GET"})
     */
    public function topWinners(int $id): JsonResponse
    {
        return new JsonResponse([]);
    }
}
