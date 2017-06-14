class Poster < ApplicationRecord
	has_many :user
	has_attached_file :logo, styles: {:large =>  "545x125!", thumb: "100x100>"},default_url: "/images/:style/no_image.png", url: "/images/poster/:id/:style/logo.png"
	has_attached_file :img1a, styles: {:large =>  "795x525!", thumb: "100x100>"},default_url:"/images/:style/no_image.png", url: "/images/poster/:id/:style/imagen1a.png"
	has_attached_file :img1b, styles: {:large =>  "795x525!", thumb: "100x100>"},default_url:"/images/:style/no_image.png", url: "/images/poster/:id/:style/imagen1b.png"
	has_attached_file :img2, styles: {:large =>  "1126x730!", thumb: "100x100>"},default_url:"/images/:style/no_image.png" , url: "/images/poster/:id/:style/imagen2.png"
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
	validates_attachment_content_type :img1a, content_type: /\Aimage\/.*\z/
	validates_attachment_content_type :img1b, content_type: /\Aimage\/.*\z/
	validates_attachment_content_type :img2, content_type: /\Aimage\/.*\z/
end
