Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fed1mtao03.cox.net (fed1mtao03.cox.net [68.6.19.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4E0A4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 12:08:44 -0700 (MST)
Message-ID: <3E343138.6000205@cox.net>
Date: Sun, 26 Jan 2003 12:04:24 -0700
From: Tom Ward <tward800@cox.net>
MIME-Version: 1.0
To: max@avtlg.ru
Cc: PA-RISC <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Boot warning 80F5.
References: <3E340091.2000003@avtlg.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Max wrote:

> Hi,
>
>    I have HP 9000/809/k100. When my box boot from Debian 3.0r1 hppa CD
> ( Interact with IPL (Y or N)?> Y ), i've got message "Cannot find ENTRY
> TEST Status= -4" and WARN 80F5 on LCD panel status. What is that means?
> What do I do?
> Where can I find other WARN description ?
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailmanhttp://us-support3.external.hp.com/listinfo/parisc-linux 
>
>
The forums on HP's ITRC, http://us-support3.external.hp.com, are a great 
resource for thing like this.

 From a google cache of ITRC:
*80F5*means that firmware can not initialize device. Stable storage 
message may mean NVRAM (setup) corruption. Try restoring defaults in the 
PDC, then tune it as it was before (paths, boot parameters, etc). Check 
if this code appears again
Eugeny

Regards,
Tom
