Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.kabelleipzig.de (unknown [80.146.194.2])
	by dsl2.external.hp.com (Postfix) with SMTP id 1B1C74860
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 01:05:20 -0600 (MDT)
Received: from kabelleipzig.de (10.50.33.20)
          by mail.kabelleipzig.de with MERCUR-SMTP/POP3/IMAP4-Server (v3.30.09 AS-000000008)
          for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Jul 2002  09:05:16 +0200
Message-ID: <3D293951.6060702@kabelleipzig.de>
Date: Mon, 08 Jul 2002 09:03:45 +0200
From: sven schnelle <schnelle@kabelleipzig.de>
MIME-Version: 1.0
To: Patrick Caulfield <patrick@tykepenguin.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb include files
References: <3D27D979.8050100@kabelleipzig.de> <20020708001146.GA3685@systemhalted> <20020708064246.GC815@tykepenguin.com>
Content-Type: multipart/alternative;
 boundary="------------040502000209020904040806"
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

--------------040502000209020904040806
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Patrick Caulfield wrote:

>On Sun, Jul 07, 2002 at 08:11:47PM -0400, Carlos O'Donell wrote:
>  
>
>>>hello,
>>>
>>>Im writing on a floppy driver for my 712 and want to use kdb,
>>>
>>>but when i try to compile the kernel with it, i get errors:
>>>
>>>kdb/break.h: No such file or directory
>>>kdb/kgdb_types.h: No such file or directory
>>>kdb/kgdb_machine.h: No such file or directory
>>>kdb/trap.h: No such file or directory
>>>
>>>does anybody know where i can get this files ?.
>>>
>>>bye
>>>    sven
>>>      
>>>
>>If you haven't already done so, I would recommend getting 
>>a kdb patched source tree from cvs.parisc-linux.org
>>
>>There is a 'kdb_v21' branch for the 'linux' tree.
>>
>>cvs co -rkdb_v21 linux
>>
>>Please take a look at:
>>http://cvs.parisc-linux.org
>>
>>Note: That I'm currently working on kdb's stability...
>>so you might not get something that is as happy as you
>>expect from other platofrms.
>>    
>>
>
>It's a little confusing that there's mention of KDB in the
>non-KDB enabled kernel. Under General Options it says 
>"Kernel Debugger support" which seems (to me) to have the
>sole function of generating the above messages :)
>
>patrick
>  
>
that's right. If I disable it under general options and patch 
the kernel as written above kdb works.

thanks, 

  sven



--------------040502000209020904040806
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
Patrick Caulfield wrote:<br>
<blockquote type="cite" cite="mid20020708064246.GC815@tykepenguin.com">
  <pre wrap="">On Sun, Jul 07, 2002 at 08:11:47PM -0400, Carlos O'Donell wrote:
  </pre>
  <blockquote type="cite">
    <blockquote type="cite">
      <pre wrap="">hello,

Im writing on a floppy driver for my 712 and want to use kdb,

but when i try to compile the kernel with it, i get errors:

kdb/break.h: No such file or directory
kdb/kgdb_types.h: No such file or directory
kdb/kgdb_machine.h: No such file or directory
kdb/trap.h: No such file or directory

does anybody know where i can get this files ?.

bye
    sven
      </pre>
    </blockquote>
    <pre wrap="">If you haven't already done so, I would recommend getting 
a kdb patched source tree from cvs.parisc-linux.org

There is a 'kdb_v21' branch for the 'linux' tree.

cvs co -rkdb_v21 linux

Please take a look at:
<a class="moz-txt-link-freetext" href="http://cvs.parisc-linux.org">http://cvs.parisc-linux.org</a>

Note: That I'm currently working on kdb's stability...
so you might not get something that is as happy as you
expect from other platofrms.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
It's a little confusing that there's mention of KDB in the
non-KDB enabled kernel. Under General Options it says 
"Kernel Debugger support" which seems (to me) to have the
sole function of generating the above messages :)

patrick
  </pre>
</blockquote>
<pre wrap="">that's right. If I disable it under general options and patch 
the kernel as written above kdb works.

thanks, 

  sven
</pre>
<br>
</body>
</html>

--------------040502000209020904040806--
