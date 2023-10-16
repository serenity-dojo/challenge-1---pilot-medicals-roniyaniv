Feature: pilot medicals

In order to encourage pilots to renew their medical examinations on time in a fair manner
As an airline regulator
I want pilots to be downgraded to the next lower License Class if they don't renew their medicals

For full description of the feature, see https://expansion.serenity-dojo.com/courses/take/serenity-dojo-agile-and-bdd-requirements-discovery/texts/37229814-bdd-challenge-pilot-medicals


    Rule: Any pilot needs a valid medical certificate to fly or be grounded
    Rule: Pilot license class is downgraded to next lower class when their medical cert is expired

        Scenario Outline: Pilot license class is determined by their medical exam validity
            Given Peter is a <License Class> pilot
            And was born on <Birth Date> 
            When last medical was performed on <Last Medical Date>
            And current date is <Current Date>
            Then their next medical date should be no later than <Next Medical Date>
            And their pilot license class should be <New License Class>

            Examples: 1st Class Rules
                | Class     | Birth Date | Last Medical Date    | Current Date  | New Class | Next Medical Date     | Comment                                        |
                | 1st Class | 2000-01-01 | 2023-01-20           | 2023-08-01    | 1st Class | 2024-01-31            | Pilot age is under 40, cert is < 12 months old |
                | 1st Class | 2000-01-01 | 2022-01-20           | 2023-08-01    | 3rd Class | 2027-01-31            | Pilot age is under 40, cert is > 12 months old |
                | 1st Class | 1980-01-01 | 2023-06-20           | 2023-08-01    | 1st Class | 2023-12-31            | Pilot age is over 40, cert is < 6 months old   |
                | 1st Class | 1980-01-01 | 2023-01-20           | 2023-08-01    | 2nd Class | 2024-01-31            | Pilot age is over 40, cert is > 6 months old   |
            
            Examples: 2nd Class Rules
                | Class     | Birth Date | Last Medical Date    | Current Date  | New Class | Next Medical Date     | Comment                                        |
                | 2nd Class | 2000-01-01 | 2023-01-20           | 2023-08-01    | 2nd Class | 2024-01-31            | Pilot age is under 40, cert is < 12 months old |
                | 2nd Class | 2000-01-01 | 2022-01-20           | 2023-08-01    | 3rd Class | 2027-01-31            | Pilot age is under 40, cert is > 12 months old |
                | 2nd Class | 1980-01-01 | 2023-01-20           | 2023-08-01    | 2nd Class | 2024-01-31            | Pilot age is over 40, cert is < 12 months old  |
                | 2nd Class | 1980-01-01 | 2022-01-20           | 2023-08-01    | 3rd Class | 2024-01-31            | Pilot age is over 40, cert is > 12 months old  |

            Examples: 3rd Class Rules
                | Class     | Birth Date | Last Medical Date    | Current Date  | New Class | Next Medical Date | Comment                                           |
                | 3rd Class | 2000-01-01 | 2023-01-20           | 2023-08-01    | 3rd Class | 2028-01-31        | Pilot age is under 40, cert is < 60 months old    |
                | 3rd Class | 2000-01-01 | 2018-01-20           | 2023-08-01    | Grounded  | 2023-08-01        | Pilot age is under 40, cert is > 60 months old    |
                | 3rd Class | 1980-01-01 | 2023-01-20           | 2023-08-01    | 3rd Class | 2025-01-31        | Pilot age is over 40, cert is < 24 months old     |
                | 3rd Class | 1980-01-01 | 2021-01-20           | 2023-08-01    | Grounded  | 2023-08-01        | Pilot age is over 40, cert is > 24 months old     |

