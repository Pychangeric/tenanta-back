class MpesaController < ApplicationController
    def register_urls
      response = Mpesa::C2B.register_url(
        shortcode: 'your_shortcode',
        response_type: 'Completed',
        confirmation_url: 'your_confirmation_url',
        validation_url: 'your_validation_url'
      )
  
      render json: response
    end
    def confirmation_callback
        # Process Mpesa confirmation callback
        # This action will be called by Mpesa when a payment is completed
    
        render json: { message: 'Confirmation received' }
      end
    
      def validation_callback
        # Process Mpesa validation callback
        # This action will be called by Mpesa for validation before completing a payment
    
        # Example response for successful validation
        render json: {
          ResultCode: '0',
          ResultDesc: 'Accepted'
        }
    
        # Example response for rejected validation
        # render json: {
        #   ResultCode: 'C2B00011',
        #   ResultDesc: 'Rejected'
        # }
      end
  end
  