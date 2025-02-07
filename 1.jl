using HorizonSideRobots

function crest!(robot)
    for side ∈ (Nord, Ost, Sud, West)
        num_steps = mark_direct!(robot, side)
        side = inverse(side)
        move!(robot, side, num_steps)
    end
end

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side)+2)%4)

function mark_direct!(robot, side)
    n=0::Int
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
        n+=1
    end
    return n 
end   
