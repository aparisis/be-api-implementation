<?php
namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TicketController extends AbstractController
{
    /**
     * @Route("/ticket", name="create_ticket", methods={"POST"})
     */
    public function create(): JsonResponse
    {
        return new JsonResponse([]);
    }

    /**
     * @Route("/ticket/{id}", name="get_ticket", methods={"GET"}, requirements={"id"="\d+"})
     */
    public function read(int $id): JsonResponse
    {
        return new JsonResponse([]);
    }
}
