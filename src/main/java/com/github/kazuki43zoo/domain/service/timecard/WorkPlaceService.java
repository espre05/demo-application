package com.github.kazuki43zoo.domain.service.timecard;

import com.github.kazuki43zoo.domain.model.timecard.WorkPlace;

public interface WorkPlaceService {

    WorkPlace getWorkPlace(String workPlaceUuid);

    WorkPlace getWorkPlaceDetail(WorkPlace workPlace);

}