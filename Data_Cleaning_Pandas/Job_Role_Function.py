role_map = {    'Business Analyst':['Business Analyst','BI Analyst','Business Analytics'],
                'Data Analyst' :   ['Data_Analyst','Marketing Analyst','Reporting Analyst','Product Analyst',
                                'Junior Data Analyst', 'Data Analyst Junior','Data Visualization Analyst','Analyst','Data Analytics','Data Analysis','Data & Analytics'],
                'Data Scientist':['Data Scientist','Junior Data Scientist','Data Science Analyst', 'Data Science'],
                'Operation Analyst':['Operations Analyst'],
                'Financial Analyst':['Financial Analyst'],
                'Data Engineer':['Data Engineer','Database Engineer','Database'],  
                'SQL Developer':['SQL Developer','SQl'],
                'Software Engineer':['Software Engineer','Software'],
                'Web Developer':['Web Developer', 'Web Development', 'WordPress', 'Full Stack'],
                '.Net Developer': ['.Net Developer','Dot Net Developer' ] , 
                'IOS Developer':['IOS Developer','IOS'],
                'Python Developer':['Python Developer', 'Python'],
                'Java Developer':['Java Developer','Java'],
                'C/C++ Developer':['C/C++_Developer','C/C++','C++'],
                'Javascript Developer':['Javascript_Developer','Javascript','React JS','Reactjs','Nodejs','Node JS', 'JS Developer'],
                'Technical Support_Engineer' : ['Technical_Support_Engineer','Technical', 'Tech Support', 'Technical Support'],
                'Application Developer':['Application_Developer'],
                'Frontend Developer': ['Frontend','HTML','CSS'],
                'Backend Developer':['Backend'],
                'Mechenical Engineer':['Mechenical'],
                'Civil Engineer' : ['Civil'],
                'PHP Developer':['PHP'],
                'Android Developer':['Android'],
                'Digital Marketing':['Digital Marketing','SEO','Search Engine Optimization'],
                'Cloud Engineer':['Cloud Enginner','Azure','AWS'],
                'Testing Developer': [ 'Testing', 'Software Testers'],
                'UI/UX Engineer':['UI','UX','UI/UX'],
                'Game Developer':['Game'],
                'Data Entry Operator':['Data Entry'],
                'Customer Support':['Customer Support'],
                'Mobile App Developer':['Mobile App Developer', 'Mobile'],
                'AI Engineer':['Ai', 'ML','AIML','Artificial Intelligence','AI/ML' 'Machine Learning'],
                'IOT Engineer':['IOT', 'Internet Of Things']
                }

def map_job_role(title):
    title = str(title).lower()
    for role, patterns in role_map.items():
        for pattern in patterns:
            if pattern.lower() in title:
                return role
    return None