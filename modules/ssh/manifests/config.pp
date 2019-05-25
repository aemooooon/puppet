class ssh::config {
        file { "/etc/ssh/sshd_config":
                ensure => present,
                source => "puppet:///modules/ssh/sshd_config",
                mode => 0444,
                owner => "root",
                group => "root",
		require => Class["ssh::install"],
		notify => Class["ssh::service"],
        }
	ssh_authorized_key { "sysadmin_manager":
		user => "manager",
		type => "ssh-rsa",
		key => "AAAAB3NzaC1yc2EAAAABJQAAAgEAhoyO7v1iKFn91oeB9g26IRlfjJ0EduGtlxyi7GX0dVPVK/mRNzArhKKgmPAGL9SSbFOKkoCCf51DytebODBUshznWtettpfiejVNkBMZuTSJQ2ZF4TxlK80ZkgEUkdd5DxOJdEBMDFe2q0K0M+6rEcfT6ddxVGunCvq9EF3jFdm6bvAaZ248scVLRqUYNxatnnLKtKqNz9OERVBC31uL6CFMi7fYOENBG1+82tu0dKPlIt0D5A5ZUQ9aNMg9b+Ie9JDERDbb9BxSk/6nDHdKxJxQ1Z39hcTvf/INMdYE75BD5A8lGr/1ushKColCy2Ew5ywMGZ2qncHPgKBLdwQhYJdM6VA8voRw993j/VWqKY3enQu4vEWePZPzyJgukt7ctVmupl8eacygLJyDGE3hGi9HRYctg+JAYjteWTq9pO6s7Dd9DNTsjdd104l8bjOz0ZDbdVPPQxfdf5owhQmiAg1saHxWOpCDkaphrNWq2fjhlamA0lYDb9H4wHL40X5UYv3whx7EmZAUhYvFYwTqOmHoWWarrBq73fs8sE2TkqlKwVGAD8PDTH+K3MSwuLypnNnR70jY5mXOU2z6v9M5m3U4JkI5au+kMGa96fEcMo09c73dJtlvxhmH2viYzlS1nnu9Sy4Kr86+d9gaou4u8kGLqEbJkghST6HtnpWYK7s=",
				
}

        ssh_authorized_key { "wangh21@student.op.ac.nz":
                user => "hua",
                type => "ssh-rsa",
                key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDPHEVa2Ym7G6sXcDkm7IzXi4oWch/kPTKersDIxuSJd8SqcycoQHZNKkx5nVEWGKi5HZL3GKzISVmOxJ7CQ1ELdqQNLI1H5UxUcDKXsywt2CZZHLwZiB/7wJESwhZkVEUpOnRgyt3RTdYaK5/WWv31Cw+Ir0S5JZKSSUlY1JB6l/peF7j6HGLj3Q9mxih4qDCWmH+CDivsU8JWBkyYTIE7Nd8qfpHybnqqCUYZty9B+dNGvPWXjF/vvB/uuEHzo6NL0zGlmGW/ADiBlD2JKivBCt2EinW7tN9FZoH7I+g7f7qDB87vLq6PqJps4E4SjbpPX1WaPmVKbR42QBiX6VLL",
        }

ssh_authorized_key {"armad@DESKTOP-26IGNE9":
	user=>"adamv",
	type => "ssh-rsa",
	key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDMkCoBDbZrC/pWCpPir1Tl4kT5k0NKDynKpCq2pnYBOgyB/FbpZAVqytDBB5mHvt3LaTAB+JJAQfXCrLhnXqNQMXL00FQm3w6h7zTOtX0Y3ZZPhYWZjDLW9PGd5Ark0Tz/+hL2gGxMIKxwCctGpyH6C3x+LtGWOHW+vGalnHK3zIJabI2iuXFggvyrSBy+7t5inOlMc7hoj8Xai7iY6BQBi5U/uUFFaaoSw6Ga+JRb2vLvenKmdYW+R63SXA90D8R7F782c+CRUWAbW53ZYMwXhhgrA5vPpQiQqxgON2/0JS/oO/M5DC/X8VrTi1A7kFm6SRR4z1l7isIa23he2sG/",


}


}
