From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [klibc] [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 15:55:56 -0700
Message-ID: <44C54FFC.1070807@zytor.com>
References: <200607241935.k6OJZkNs000939@hiauly1.hia.nrc.ca>
	<44C54CAE.5050302@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org
To: "H. Peter Anvin" <hpa@zytor.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44C54CAE.5050302@zytor.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

H. Peter Anvin wrote:
> 
> (k)libc.so isn't a shared library in the ELF sense.  It's an executable.
> 

... specifically, as far as ELF (and the kernel) is concerned, it's the 
ELF interpreter; it's linked at a fixed address and the application 
invokes it with usual static jumps.

Very similar to old Linux a.out stuff.  Messy and primitive, but very fast.

	-hpa
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
