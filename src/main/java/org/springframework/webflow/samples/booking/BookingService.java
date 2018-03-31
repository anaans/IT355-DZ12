package org.springframework.webflow.samples.booking;

import java.util.List;


public interface BookingService {

    
    public User findUser(String username);

    
    public List<Booking> findBookings(String username);

    
    public List<Apartman> findApartmans(SearchCriteria criteria);

   
    public Apartman findApartmanById(Long id);

   
    public Booking createBooking(Long apartmanId, String userName);

    
    public void persistBooking(Booking booking);

   
    public void cancelBooking(Long id);

}
