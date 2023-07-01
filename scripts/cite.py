# Add this to __init__.py

import pkg_resources

# Retrieve package metadata
metadata = pkg_resources.get_distribution('MyPackage')

# Create citation message
citation_message = f"Welcome to {metadata.key} v{metadata.version}!"
citation_message += f"\nThank you for using {metadata.key} by {metadata.author}."

# Print citation message when the package is imported
print(citation_message)

## Another way to solve it is to just add print statements to __init__.py

## Another way is via warnings
import warnings
from pkg_resources import get_distribution, DistributionNotFound
def issue_citation_warning():
    try:
        # Retrieve package metadata from setup.py
        distribution = get_distribution('your-package-name')
        metadata = distribution.get_metadata(distribution.PKG_INFO)

        # Create the citation message
        citation_message = f"Welcome to {metadata['Name']} v{metadata['Version']}!"
        citation_message += f"\nThank you for using {metadata['Name']} by {metadata['Author']}."

        # Issue the warning with the citation message
        warnings.warn(citation_message, UserWarning)

    except DistributionNotFound:
        # Package distribution not found, unable to retrieve metadata
        pass

issue_citation_warning()

