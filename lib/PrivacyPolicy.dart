import 'package:flutter/material.dart';

class privacy extends StatelessWidget {
  const privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy policy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: const Text(
            '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eleifend non augue rutrum fermentum. Aliquam dignissim, justo vel pellentesque finibus, lectus turpis semper metus, id consectetur leo ipsum nec neque. Suspendisse lobortis magna in orci hendrerit porttitor. Fusce non ultrices ante.

Morbi dictum urna vestibulum, condimentum tellus sed, sollicitudin urna. Fusce eget est vitae diam tristique ultricies et eu eros. Aliquam sollicitudin ligula eu felis accumsan, ut varius lorem porttitor. Sed in aliquet quam.

Sed rutrum, arcu vitae ornare placerat, ex justo convallis metus, sed auctor urna dui sed leo. Nam egestas sodales sem quis finibus. Pellentesque aliquam felis venenatis consectetur fermentum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eleifend non augue rutrum fermentum. Aliquam dignissim, justo vel pellentesque finibus, lectus turpis semper metus, id consectetur leo ipsum nec neque. Suspendisse lobortis magna in orci hendrerit porttitor. Fusce non ultrices ante.

Morbi dictum urna vestibulum, condimentum tellus sed, sollicitudin urna. Fusce eget est vitae diam tristique ultricies et eu eros. Aliquam sollicitudin ligula eu felis accumsan, ut varius lorem porttitor. Sed in aliquet quam.
''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
