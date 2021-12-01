class Genders:
    MALE = 'male'
    FEMALE = 'female'
    UNKNOWN = 'unknown'

    CHOICES = [
        (MALE, 'Male'),
        (FEMALE, 'Female'),
        (UNKNOWN, 'Unknown')  
    ]

class Education:
    NONE = 'none'
    FRIMARY = 'primary'
    SECONDARY = 'secondary'
    HIGH = 'high'
    UNIVERSITY = 'university'
    MASTER = 'Master'

    CHOICES = [
        (NONE, 'None'),
        (FRIMARY, 'Primary'),
        (SECONDARY, 'Secondary'),
        (HIGH, 'High'),
        (UNIVERSITY, 'University'),
        (MASTER, 'Master')
    ]

class MarryStatus:
    MARRIED = 'married'
    SINGLE = 'single'
    DIVORCE = 'divorce'
   
    CHOICES = [
        (MARRIED, 'married'),
        (SINGLE, 'single'),
        (DIVORCE, 'Divorced'),
    ]

    