From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Wed, 5 Jan 2005 16:01:23 -0600
Message-ID: <200501051601.23521.mszick@wolfbutter.com>
References: <200501050000.j0500iKD024978@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501050000.j0500iKD024978@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue January 4 2005 18:00, John David Anglin wrote:

> 
> This is what the GCC machine definitions says:
> 

> ;;
> ;; It's worth noting that there is no way to saturate all the functional
> ;; units on the PA8000 as there is not enough issue bandwidth.
> 
> Comments?
>
Thanks,
That is what I tried to say but couldn't find the reference.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
