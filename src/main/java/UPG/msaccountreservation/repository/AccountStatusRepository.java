package UPG.msaccountreservation.repository;

import UPG.msaccountreservation.entity.AccountStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountStatusRepository extends JpaRepository<AccountStatus, Long> {
}
