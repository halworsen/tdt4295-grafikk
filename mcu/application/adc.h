// Initialize the ADC for single input samples using VDD for reference
void initADC_scan(int ref);

// Handler for reading the value from the ADC
void ADC0_IRQHandler(void);
