From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC][PATCH] Fix HPMC handler by increasing size to multiple of
 16 bytes
Date: Mon, 19 Mar 2018 18:58:35 -0400
Message-ID: <a189ed45-af4b-e6cc-db2c-ce50fa706c72@bell.net>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box>
 <81f118a7-5bc5-c6b2-eb10-a9c683c72a26@bell.net>
 <20180319222353.GA28132@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20180319222353.GA28132@ls3530.fritz.box>
Resent-Message-ID: <cM_ZlRJcRCL.A.-lC.tCEsaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/a189ed45-af4b-e6cc-db2c-ce50fa706c72@bell.net

On 2018-03-19 6:23 PM, Helge Deller wrote:
> -	length = os_hpmc_size;
> -	ivap[7] = length;
> +	length = ALIGN(os_hpmc_size, 16);
> +	ivap[7] = length; /* length needs to be multiple of 16. */
If this is true, should we not add three nops to the end of os_hpmc so 
it has a length which is a multiple of 16?

Dave
