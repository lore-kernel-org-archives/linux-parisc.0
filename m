From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [klibc] [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 15:41:50 -0700
Message-ID: <44C54CAE.5050302@zytor.com>
References: <200607241935.k6OJZkNs000939@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607241935.k6OJZkNs000939@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin wrote:
>>> hppa64-linux-gnu-ld: usr/klibc/libc.so: Not enough room for program headers (allocated 5, need 6)
> 
> Additional phdrs are provided by elf64_hppa_additional_program_headers
> in bfd/elf64-hppa.c.  The code doesn't expect a .interp section in
> a shared library.  That would appear to be the problem here.
> 

(k)libc.so isn't a shared library in the ELF sense.  It's an executable.

klibc doesn't do dynamic linking at all.  As Dave said, dynamically 
linked doesn't imply the presence of shared libraries; the converse is 
also true.

	-hpa

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
