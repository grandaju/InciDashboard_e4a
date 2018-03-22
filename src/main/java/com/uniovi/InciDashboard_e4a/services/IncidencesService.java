package com.uniovi.InciDashboard_e4a.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uniovi.InciDashboard_e4a.entities.Incidence;
import com.uniovi.InciDashboard_e4a.repositories.IncidencesRepository;

@Service
public class IncidencesService {
	@Autowired
	private IncidencesRepository incidencesRepository;

	public List<Incidence> getAllIncidences() {
		return incidencesRepository.findAll();
	}

	public void addIncidence(Incidence incident) {
		incidencesRepository.save(incident);
	}

	public void deleteIncidenceByName(String inciName) {
		incidencesRepository.deleteByInciName(inciName);
	}

	public Optional<Incidence> getIncidence(Long id) {
		return incidencesRepository.findById(id);
	}
}
