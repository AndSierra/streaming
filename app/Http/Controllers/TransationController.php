<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTransationRequest;
use App\Http\Requests\UpdateTransationRequest;
use App\Http\Controllers\AppBaseController;
use App\Repositories\TransationRepository;
use Illuminate\Http\Request;
use Flash;

class TransationController extends AppBaseController
{
    /** @var TransationRepository $transationRepository*/
    private $transationRepository;

    public function __construct(TransationRepository $transationRepo)
    {
        $this->transationRepository = $transationRepo;
    }

    /**
     * Display a listing of the Transation.
     */
    public function index(Request $request)
    {
        $transations = $this->transationRepository->paginate(10);

        return view('transations.index')
            ->with('transations', $transations);
    }

    /**
     * Show the form for creating a new Transation.
     */
    public function create()
    {
        return view('transations.create');
    }

    /**
     * Store a newly created Transation in storage.
     */
    public function store(CreateTransationRequest $request)
    {
        $input = $request->all();

        $transation = $this->transationRepository->create($input);

        Flash::success('Transation saved successfully.');

        return redirect(route('transations.index'));
    }

    /**
     * Display the specified Transation.
     */
    public function show($id)
    {
        $transation = $this->transationRepository->find($id);

        if (empty($transation)) {
            Flash::error('Transation not found');

            return redirect(route('transations.index'));
        }

        return view('transations.show')->with('transation', $transation);
    }

    /**
     * Show the form for editing the specified Transation.
     */
    public function edit($id)
    {
        $transation = $this->transationRepository->find($id);

        if (empty($transation)) {
            Flash::error('Transation not found');

            return redirect(route('transations.index'));
        }

        return view('transations.edit')->with('transation', $transation);
    }

    /**
     * Update the specified Transation in storage.
     */
    public function update($id, UpdateTransationRequest $request)
    {
        $transation = $this->transationRepository->find($id);

        if (empty($transation)) {
            Flash::error('Transation not found');

            return redirect(route('transations.index'));
        }

        $transation = $this->transationRepository->update($request->all(), $id);

        Flash::success('Transation updated successfully.');

        return redirect(route('transations.index'));
    }

    /**
     * Remove the specified Transation from storage.
     *
     * @throws \Exception
     */
    public function destroy($id)
    {
        $transation = $this->transationRepository->find($id);

        if (empty($transation)) {
            Flash::error('Transation not found');

            return redirect(route('transations.index'));
        }

        $this->transationRepository->delete($id);

        Flash::success('Transation deleted successfully.');

        return redirect(route('transations.index'));
    }
}
