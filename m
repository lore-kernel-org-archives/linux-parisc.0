Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA06175
	for <parisc-linux@puffin.external.hp.com>; Mon, 2 Oct 2000 19:26:19 -0600
Message-ID: <56D553C0B61BD311AD2300A0C9F485C208EDD8A8@xfc02.fc.hp.com>
From: "MEYER,ALAN C. \(HP-FtCollins,ex1\)" <alan_meyer@hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] I am not your mother!
Date: Mon, 2 Oct 2000 19:17:55 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

FYI, there have been some discussions between LC and HP about various
improvements to the web site.  If you are planning any significant changes
to the web site, it would be good to make sure  Jane is aware ... LC was
going to take the next step on proposing how we move ahead with some
suggested improvements.

Ala

>-----Original Message-----
>From: Matthew Wilcox [mailto:matthew@wil.cx]
>Sent: Monday, October 02, 2000 8:26 AM
>To: David Huggins-Daines
>Cc: Matthew Wilcox; parisc-linux@thepuffingroup.com
>Subject: Re: [parisc-linux] I am not your mother!
>
>
>On Mon, Oct 02, 2000 at 10:17:11AM -0400, David Huggins-Daines wrote:
>> Matthew Wilcox <matthew@wil.cx> writes:
>> 
>> > Is there anything which can be done to make updating the 
>website easier?
>> 
>> I keep losing the password, that's the only problem.
>
>It's tunnelled over ssh.  You can put your identity.pub in the 
>appropriate
>machine's authorized_keys file.  Hm, I should probably take 
>mine out :-)
>It's currently up to date.
>
>> I'd really prefer to have the website be updated from a cron job.
>
>Doable.  I'd prefer this as well -- or even better from a trigger which
>runs as soon as there's a cvs commit to the website directory.
>
>> Obviously it would be better for it to be hosted on PEHC in 
>this case,
>> since otherwise we'd have to store the password in the clear on
>> PEHC or whatever machine runs that job.
>
>I think the plan is to move it to pehc once pehc's been upgraded.
>Matt?  Any idea on when this'll happen?
>
>-- 
>Revolutions do not require corporate support.
>
>---------------------------------------------------------------
>------------
>To unsubscribe: send e-mail to 
>parisc-linux-request@thepuffingroup.com with
>`unsubscribe' as the subject.
>
