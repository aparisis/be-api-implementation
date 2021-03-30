<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class UserController extends AbstractController
{
    /**
     * @Route("/user/{id}", name="update_user", methods={"PATCH"}, requirements={"id"="\d+"})
     */
    public function update(Request $request, int $id): JsonResponse
    {
        // To get the request json body
        // $request->toArray();
        return new JsonResponse([]);
    }

    /**
     * @Route("/user/top", name="get_top_winners", methods={"GET"})
     */
    public function topWinners(): JsonResponse
    {
        return new JsonResponse([]);
    }
}
