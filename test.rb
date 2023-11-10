require 'pry'
lyrics = "1\n[C]A separ[Am]ated [F]one I long to [G]be\n[C]A freewill [Am]offer[F]ing to [G]You\n[C]A volun[Am]teer to [F]serve You faith
ful[G]ly,\n[C]To linger [Am]in Your [F]presence, [G]Lord\nAnd [Am]feed [F]upon Your [G]living [C]Word.\n\n  [C]My [F]Lord, You [G]are the [C]richest \n  [Am
]grace\n  The [F]sweetest [G]love,\n  My [C]strength and [C7]song.\n  I [F]long to [G]live be[C]fore Your [Am]face—\n  A [F]life above—All [G]my life [C]lon
g.\n\n2\nLord, separate me now from everything\nRelated to the world’s joy.\nI would abstain from every earthly joy\nNot sourced in You. You are my joy!\nCl
eanse now my heart from all alloy.\n\n3\nYou are the Head with all authority.\nI’d follow You and serve You too,\nObeying and awaiting Your commands,\nSubmi
tting to Your word, all still.\nSubdue me now, make Yours my will.\n\n4\nI long for life to flow within my being,\nSo I would separate from death\nAnd its c
ontamination all around.\nI would be swallowed up by life,\nPreserved and free from deathly strife.\n\n5\nI take this vow: I give myself to You.\nI voluntee
r myself for You\nTo use—How great Your need!—I offer all,\nAnd offer to You solemnly.\nI count the cost—paid willingly."

lyrics2 = "{capo: 3}\n\n1\n[G]Christ [C9]has [G]come to be [C9]life,\nThe [G]processed di[C9]vine Trini[G]ty.[C9]\n[G]God [C9]the [G]Father’s the [C9]source,\nA [G]fountain e[C9]merging to [G]be[C9]\nGod the [D]Son as a [C9]gushing-up [G]spring.\nIn the [Am]Spirit, a river, for [C9]life impar[G]ting\nOh, [Em]how can this miracle [C]be?\nThe [Am]Triune God flowing in [D]me!\nOh, [G]I’ve [C9]got [G]rivers of [C9]life,\nFlowing [G]out of my [C9]innermost [G]being![C9]\n[G]I’ve [C9]got [G]rivers of [C9]life,\nFlowing [G]out of my [C9]innermost [G]being!\n\n  As this [Em]life [D]flows through [G]me,\n  [Em]I’m sup[C]plied a[D]bundant[G]ly!\n  [Em]His [C]life [G]nullifies [D]sin;\n  [Em]Pow'r s[C]prings [G]now from with[D]in!\n  To be [Em-C]free, over[G]coming spon[D]taneous[G]ly!\n\n2\nYet this life though it frees,\nIs not meant for mere victory.\nGod is full of intent\nAnd never could flow aimlessly.\nSo this life has a totality,\nA consummate issue encompassing me.\nLife moves and life grows,\nLife shapes as it flows,\nNow I share in this life’s destiny.\nOh, I’ve got rivers of life,\nFlowing out of my innermost being!\nI’ve got rivers of life,\nFlowing out of my innermost being!\n\n  We’ll abide mutually,\n  God and man revealed to be\n  Lamb, Wife, Spirit, and Bride.\n  Come! Drink! And riverside,\n  Grows the tree,\n  Our enjoyment for eternity!\n\n3\nSo I’ve no cause to frown\nAs one who’s received this zoe.\nI know life runs its course,\nAnd triumphs inevitably.\nI’m required just to stay in the flow.\nIf I do the drinking\nThen God gives the growth.\nSo there’s joy in my heart,\nAnd a spring in my step,\nAnd a smile on my face as I sing,\nOh, I’ve got rivers of life,\nFlowing out of my innermost being!\nI’ve got rivers of life,\nFlowing out of my innermost being!\n\n{comment: (Do not repeat chorus)}"


lyrics3 =  "{capo: 2}\n\n1\n[D]We have an inner life;\n[G]That’s for our daily life;\n[D]That’s for the [Bm]meeting life—just C[A]hrist! [A7]\n[D]We’ll live the inner life;\n[G]We’ll have the daily life;\n[D]We’ll see the [Bm]meeting life—\nThat’s [A]just the [D]church.\n\n2\nChrist is our inner life;\nHe’s in our spirit now;\nNot far away from us—He’s right inside!\nAnd as we turn to Him\nAnd take Him as our all\nHe will become in us our inner life.\n\n3\nOut from our inner life\nWill come our daily life,\nAnd all our living be filled up with Christ.\nThen as we live by Him,\nHe lives His life in us,\nAnd He becomes to us our daily life.\n\n4\nThe real experience of Christ in daily life,\nWill fill the meeting life with Christ Himself.\nNot empty forms and such,\nBut Christ will be so much;\nAnd we will see Him here as\nThe meeting life.\n\n5\nWithout the inner life there is no daily life,\nThere is no meeting life, there is no church!\nChrist as our inner life,\nChrist in our daily life\nWill make the meeting life new and glorious!"

lyrics4 = "{comment: 2 Corinthians 3:2-3}\n\n[D]You are our l[C]etter,\n[G]Inscribed in [A]our hearts,\n[D]Known and read by [C]all men,\n[G]Known and read by [A]all men,\n\n\n  [GM7]Since you are being [C]manifested\n  [Am]That you are a [F]letter of [D]Christ,\n  [GM7]A letter of Christ mini[C]stered by us,\n  [Am]Inscribed not with [F]ink\n  [Am]But with the [D]Spirit\n\n  [G]You are our [C]letter,\n  [G]You are a [C]letter of [Am]Christ\n  [F]Inscribed with the [Am]Spirit of the [D]living God;\n\n[GM7]Not in tablets [C]of stone\n[Am]But in tablets of [D]hearts of f[G]lesh."

# def transform_song(song)
#   song_parts = song.split("\n\n")
#   binding.pry
#   song_parts[1] = "{soc}\n" + song_parts[1] if song_parts[1]
#   song_parts[1] = song_parts[1] + "\n{eoc}"
#   song = song_parts.join("\n")
#   song
# end

def transform_chorus(song)
  song_parts = song.split("\n\n")
  if song_parts.none? { |part| part.strip.to_i != 0 }
    return song
  end
  song_parts.map!.with_index do |part, index|
    stripped_part = part.strip
    if !stripped_part.start_with?('{') && !stripped_part.empty? && stripped_part.to_i == 0
      "{soc}\n" + part + "\n{eoc}"
    else
      part
    end
  end
  song = song_parts.join("\n\n")
  song
end

# def transform_song(song)
#   song_parts = song.split("\n\n")
#   song_parts[1] = "{soc}\n" + song_parts[1] if song_parts[1]
#   song_parts[1] = song_parts[1] + "\n{eoc}"
#   song = song_parts.join("\n")
#   song
# end

# def blah_song2(song)
#   song_parts = song.split("\n\n")
#   soc_added = false
#   song_parts.map!.with_index do |part, index|
#     stripped_part = part.strip
#     if !soc_added && index > 1 && !stripped_part.start_with?('{') && !stripped_part.empty?
#       soc_added = true
#       "{soc}\n" + part
#     elsif soc_added && !stripped_part.start_with?('{') && !stripped_part.empty?
#       soc_added = false
#       "{eoc}\n" + part
#     else
#       part
#     end
#   end
#   song = song_parts.join("\n\n")
#   song
# end


puts transform_chorus lyrics

puts "===================="
puts "===================="
puts transform_chorus lyrics2

puts "++++++++++++++++++++++"
puts "++++++++++++++++++++++"

puts transform_chorus lyrics3


puts "PPPPPPPPPPPPPPPPPPPPPPPPPPP"
puts transform_chorus lyrics4
